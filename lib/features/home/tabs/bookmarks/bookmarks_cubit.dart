import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/safe_cubit.dart';
import '../../../../data/bookmarks/bookmarks_repository.dart';
import '../../../../domain/models/pokemon_list_item.dart';
import 'bookmarks_state.dart';

@injectable
class BookmarksCubit extends SafeCubit<BookmarksState> {
  BookmarksCubit(this._repo) : super(const BookmarksState()) {
    log('created');
    _subscribe();
  }

  final BookmarksRepository _repo;
  StreamSubscription<List<PokemonListItem>>? _sub;

  void _subscribe() {
    _sub?.cancel();
    log('subscribe');
    _sub = _repo.watchBookmarks().listen(
      (items) {
        log('stream emit count=${items.length}');
        safeEmit(
          state.copyWith(
            items: items,
            isLoading: false,
            clearError: true,
          ),
        );
      },
      onError: (Object error) {
        log('stream error', error: error);
        safeEmit(state.copyWith(error: error, isLoading: false));
      },
    );
  }

  Future<void> toggleBookmark(PokemonListItem item) async {
    log('toggleBookmark id=${item.id}');
    await _repo.toggleBookmark(id: item.id);
  }

  @override
  Future<void> close() async {
    log('close');
    await _sub?.cancel();
    return super.close();
  }
}