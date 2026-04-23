// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pokedex_field_assistant/data/bookmarks/bookmarks_repository.dart'
    as _i570;
import 'package:pokedex_field_assistant/data/cache/app_database.dart' as _i878;
import 'package:pokedex_field_assistant/data/pokeapi/pokeapi_repository.dart'
    as _i961;
import 'package:pokedex_field_assistant/di/dio_module.dart' as _i874;
import 'package:pokedex_field_assistant/domain/weather_to_type_mapper.dart'
    as _i844;
import 'package:pokedex_field_assistant/features/home/tabs/bookmarks/bookmarks_cubit.dart'
    as _i76;
import 'package:pokedex_field_assistant/features/home/tabs/search/search_cubit.dart'
    as _i403;
import 'package:pokedex_field_assistant/features/pokemon_details/pokemon_details_cubit.dart'
    as _i779;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i878.AppDatabase>(() => _i878.AppDatabase());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i844.WeatherToTypeMapper>(
      () => const _i844.WeatherToTypeMapper(),
    );
    gh.lazySingleton<_i570.BookmarksRepository>(
      () => _i570.BookmarksRepositoryImpl(gh<_i878.AppDatabase>()),
    );
    gh.factory<_i76.BookmarksCubit>(
      () => _i76.BookmarksCubit(gh<_i570.BookmarksRepository>()),
    );
    gh.lazySingleton<_i961.PokeapiRepository>(
      () => _i961.PokeapiRepositoryImpl(
        gh<_i361.Dio>(),
        gh<_i878.AppDatabase>(),
        gh<_i844.WeatherToTypeMapper>(),
      ),
    );
    gh.factoryParam<_i779.PokemonDetailsCubit, int, dynamic>(
      (_id, _) => _i779.PokemonDetailsCubit(gh<_i961.PokeapiRepository>(), _id),
    );
    gh.factory<_i403.SearchCubit>(
      () => _i403.SearchCubit(
        gh<_i961.PokeapiRepository>(),
        gh<_i570.BookmarksRepository>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i874.DioModule {}
