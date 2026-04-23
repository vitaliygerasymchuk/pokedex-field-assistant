import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/pokemon_details.dart';
import '../../domain/models/pokemon_list_item.dart';
import '../../domain/models/weather_suggestion.dart';
import '../../domain/result.dart';
import '../../domain/weather_to_type_mapper.dart';
import '../cache/app_database.dart';

abstract class PokeapiRepository {
  Future<Result<PokemonDetails>> details(int id);

  Future<Result<int>> syncAll({
    bool force = false,
    Duration ttl = const Duration(hours: 1),
  });

  Stream<List<PokemonListItem>> watchPokemon({
    String query = '',
    Set<int>? idWhitelist,
    int offset = 0,
    int limit = 100,
  });

  Future<Result<WeatherSuggestion>> suggestByWeather({
    required double temperatureCelsius,
    double? windSpeedMps,
    int limit = 100,
  });
}

@LazySingleton(as: PokeapiRepository)
class PokeapiRepositoryImpl implements PokeapiRepository {
  PokeapiRepositoryImpl(this._dio, this._db, this._weatherMapper);

  static const _pokemonIndexCacheKey = 'pokemon_index';

  final Dio _dio;
  final AppDatabase _db;
  final WeatherToTypeMapper _weatherMapper;

  @override
  Future<Result<PokemonDetails>> details(int id) {
    return Result.guard(() async {
      final response = await _dio.get<Map<String, dynamic>>('/pokemon/$id');
      return PokemonDetails.fromJson(response.data!);
    });
  }

  @override
  Future<Result<int>> syncAll({
    bool force = false,
    Duration ttl = const Duration(hours: 1),
  }) {
    return Result.guard(() async {
      if (!force) {
        final updatedAt = await _db.cacheUpdatedAt(_pokemonIndexCacheKey);
        if (updatedAt != null && DateTime.now().difference(updatedAt) < ttl) {
          return _db.pokemonCount();
        }
      }

      final response = await _dio.get<Map<String, dynamic>>(
        '/pokemon',
        queryParameters: {'offset': 0, 'limit': 2000},
      );
      final results = response.data!['results'] as List<dynamic>;
      final rows = results.map((e) {
        final json = e as Map<String, dynamic>;
        final url = json['url'] as String;
        final segments = url.split('/').where((s) => s.isNotEmpty).toList();
        return PokemonIndexEntityCompanion.insert(
          id: Value(int.parse(segments.last)),
          name: json['name'] as String,
        );
      }).toList();

      await _db.replacePokemonIndex(rows);
      await _db.touchCache(_pokemonIndexCacheKey);
      return rows.length;
    });
  }

  @override
  Stream<List<PokemonListItem>> watchPokemon({
    String query = '',
    Set<int>? idWhitelist,
    int offset = 0,
    int limit = 100,
  }) {
    return _db
        .watchPokemon(
          query: query,
          idWhitelist: idWhitelist,
          offset: offset,
          limit: limit,
        )
        .map((rows) =>
            rows.map((r) => PokemonListItem(id: r.id, name: r.name)).toList());
  }

  @override
  Future<Result<WeatherSuggestion>> suggestByWeather({
    required double temperatureCelsius,
    double? windSpeedMps,
    int limit = 100,
  }) {
    return Result.guard(() async {
      final type = _weatherMapper.pick(
        temperatureCelsius: temperatureCelsius,
        windSpeedMps: windSpeedMps,
      );
      final response = await _dio.get<Map<String, dynamic>>('/type/$type');
      final entries = response.data!['pokemon'] as List<dynamic>;
      final pokemon = entries
          .map((e) => (e as Map<String, dynamic>)['pokemon'] as Map<String, dynamic>)
          .take(limit)
          .map((p) {
            final url = p['url'] as String;
            final segments = url.split('/').where((s) => s.isNotEmpty).toList();
            return PokemonListItem(
              id: int.parse(segments.last),
              name: p['name'] as String,
            );
          })
          .toList();
      return WeatherSuggestion(type: type, pokemon: pokemon);
    });
  }
}