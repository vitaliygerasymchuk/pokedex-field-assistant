import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

import 'tables/bookmark_entity.dart';
import 'tables/cache_metadata_entity.dart';
import 'tables/pokemon_details_entity.dart';
import 'tables/pokemon_index_entity.dart';

part 'app_database.g.dart';

@lazySingleton
@DriftDatabase(
  tables: [
    PokemonIndexEntity,
    CacheMetadataEntity,
    BookmarkEntity,
    PokemonDetailsEntity,
  ],
)
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

  Stream<List<({PokemonIndexEntityData pokemon, bool bookmarked})>>
      watchPokemon({
    String query = '',
    Set<int>? idWhitelist,
    int offset = 0,
    int limit = 100,
  }) {
    final q = select(pokemonIndexEntity).join([
      leftOuterJoin(
        bookmarkEntity,
        bookmarkEntity.id.equalsExp(pokemonIndexEntity.id),
      ),
    ]);
    final trimmed = query.trim().toLowerCase();
    if (trimmed.isNotEmpty) {
      q.where(pokemonIndexEntity.name.like('%$trimmed%'));
    }
    if (idWhitelist != null) {
      q.where(pokemonIndexEntity.id.isIn(idWhitelist));
    }
    q
      ..orderBy([OrderingTerm.asc(pokemonIndexEntity.id)])
      ..limit(limit, offset: offset);
    return q.watch().map(
          (rows) => rows
              .map(
                (r) => (
                  pokemon: r.readTable(pokemonIndexEntity),
                  bookmarked: r.readTableOrNull(bookmarkEntity) != null,
                ),
              )
              .toList(),
        );
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

  Stream<List<PokemonIndexEntityData>> watchBookmarks() {
    final q = select(bookmarkEntity).join([
      innerJoin(
        pokemonIndexEntity,
        pokemonIndexEntity.id.equalsExp(bookmarkEntity.id),
      ),
    ]);
    q.orderBy([OrderingTerm.desc(bookmarkEntity.bookmarkedAt)]);
    return q.watch().map(
          (rows) => rows.map((r) => r.readTable(pokemonIndexEntity)).toList(),
        );
  }

  Future<void> upsertPokemonDetails(PokemonDetailsEntityCompanion row) {
    return into(pokemonDetailsEntity).insertOnConflictUpdate(row);
  }

  Future<PokemonDetailsEntityData?> getPokemonDetailsById(int id) {
    return (select(pokemonDetailsEntity)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<PokemonDetailsEntityData?> watchPokemonDetails(int id) {
    return (select(pokemonDetailsEntity)..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<bool> toggleBookmark({required int id}) {
    return transaction(() async {
      final existing = await (select(bookmarkEntity)
            ..where((t) => t.id.equals(id)))
          .getSingleOrNull();
      if (existing != null) {
        await (delete(bookmarkEntity)..where((t) => t.id.equals(id))).go();
        return false;
      }
      await into(bookmarkEntity).insert(
        BookmarkEntityCompanion.insert(
          id: Value(id),
          bookmarkedAt: DateTime.now(),
        ),
      );
      return true;
    });
  }
}