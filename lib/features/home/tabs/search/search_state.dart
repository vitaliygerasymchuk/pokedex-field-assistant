import '../../../../domain/models/pokemon_list_item.dart';

class WeatherFilter {
  const WeatherFilter({required this.type, required this.ids});

  final String type;
  final Set<int> ids;
}

class SearchState {
  const SearchState({
    this.query = '',
    this.items = const [],
    this.weatherFilter,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
    this.error,
  });

  final String query;
  final List<PokemonListItem> items;
  final WeatherFilter? weatherFilter;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final Object? error;

  SearchState copyWith({
    String? query,
    List<PokemonListItem>? items,
    WeatherFilter? weatherFilter,
    bool clearWeatherFilter = false,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasReachedMax,
    Object? error,
    bool clearError = false,
  }) {
    return SearchState(
      query: query ?? this.query,
      items: items ?? this.items,
      weatherFilter: clearWeatherFilter
          ? null
          : (weatherFilter ?? this.weatherFilter),
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: clearError ? null : (error ?? this.error),
    );
  }
}