import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/bookmarks/bookmarks_repository.dart';
import '../../../../domain/models/pokemon_list_item.dart';
import 'bookmarks_state.dart';

@injectable
class BookmarksCubit extends Cubit<BookmarksState> {
  BookmarksCubit(this._repo) : super(const BookmarksState()) {
    _log('created');
    _subscribe();
  }

  static const _tag = 'BookmarksCubit';

  final BookmarksRepository _repo;
  StreamSubscription<List<PokemonListItem>>? _sub;

  void _safeEmit(BookmarksState next) {
    if (isClosed) return;
    emit(next);
  }

  void _subscribe() {
    _sub?.cancel();
    _log('subscribe');
    _sub = _repo.watchBookmarks().listen(
      (items) {
        if (isClosed) return;
        _log('stream emit count=${items.length}');
        _safeEmit(
          state.copyWith(
            items: items,
            isLoading: false,
            clearError: true,
          ),
        );
      },
      onError: (Object error) {
        if (isClosed) return;
        _log('stream error', error: error);
        _safeEmit(state.copyWith(error: error, isLoading: false));
      },
    );
  }

  Future<void> toggleBookmark(PokemonListItem item) async {
    _log('toggleBookmark id=${item.id}');
    await _repo.toggleBookmark(id: item.id);
  }

  @override
  Future<void> close() async {
    _log('close');
    await _sub?.cancel();
    return super.close();
  }

  void _log(String message, {Object? error}) {
    developer.log(message, name: _tag, error: error);
  }
}