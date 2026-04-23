import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

import 'tables/cache_metadata_entity.dart';
import 'tables/pokemon_index_entity.dart';

part 'app_database.g.dart';

@lazySingleton
@DriftDatabase(tables: [PokemonIndexEntity, CacheMetadataEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'pokedex'));

  @override
  int get schemaVersion => 1;

  Future<void> replacePokemonIndex(Iterable<PokemonIndexEntityCompanion> rows) {
    return batch((b) {
      b.deleteWhere(pokemonIndexEntity, (_) => const Constant(true));
      b.insertAll(pokemonIndexEntity, rows);
    });
  }

  Future<List<PokemonIndexEntityData>> allPokemon() =>
      select(pokemonIndexEntity).get();

  Future<int> pokemonCount() async {
    final row = await (selectOnly(pokemonIndexEntity)
          ..addColumns([pokemonIndexEntity.id.count()]))
        .getSingle();
    return row.read(pokemonIndexEntity.id.count()) ?? 0;
  }

  Stream<List<PokemonIndexEntityData>> watchPokemon({
    String query = '',
    Set<int>? idWhitelist,
    int offset = 0,
    int limit = 100,
  }) {
    final q = select(pokemonIndexEntity);
    final trimmed = query.trim().toLowerCase();
    if (trimmed.isNotEmpty) {
      q.where((t) => t.name.like('%$trimmed%'));
    }
    if (idWhitelist != null) {
      q.where((t) => t.id.isIn(idWhitelist));
    }
    q
      ..orderBy([(t) => OrderingTerm.asc(t.id)])
      ..limit(limit, offset: offset);
    return q.watch();
  }

  Future<DateTime?> cacheUpdatedAt(String key) async {
    final row = await (select(cacheMetadataEntity)
          ..where((t) => t.cacheKey.equals(key)))
        .getSingleOrNull();
    return row?.updatedAt;
  }

  Future<void> touchCache(String key) {
    return into(cacheMetadataEntity).insertOnConflictUpdate(
      CacheMetadataEntityCompanion.insert(
        cacheKey: key,
        updatedAt: DateTime.now(),
      ),
    );
  }
}