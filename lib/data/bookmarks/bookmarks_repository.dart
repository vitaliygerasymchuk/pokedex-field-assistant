import 'package:injectable/injectable.dart';

import '../../domain/models/pokemon_list_item.dart';
import '../cache/app_database.dart';

abstract class BookmarksRepository {
  Future<bool> toggleBookmark({required int id});

  Stream<List<PokemonListItem>> watchBookmarks();
}

@LazySingleton(as: BookmarksRepository)
class BookmarksRepositoryImpl implements BookmarksRepository {
  BookmarksRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<bool> toggleBookmark({required int id}) {
    return _db.toggleBookmark(id: id);
  }

  @override
  Stream<List<PokemonListItem>> watchBookmarks() {
    return _db.watchBookmarks().map(
          (rows) => rows
              .map(
                (r) => PokemonListItem(
                  id: r.id,
                  name: r.name,
                  isBookmarked: true,
                ),
              )
              .toList(),
        );
  }
}