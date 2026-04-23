import '../../../../domain/models/pokemon_list_item.dart';

class BookmarksState {
  const BookmarksState({
    this.items = const [],
    this.isLoading = true,
    this.error,
  });

  final List<PokemonListItem> items;
  final bool isLoading;
  final Object? error;

  BookmarksState copyWith({
    List<PokemonListItem>? items,
    bool? isLoading,
    Object? error,
    bool clearError = false,
  }) {
    return BookmarksState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}