import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/safe_cubit.dart';
import '../../../../data/bookmarks/bookmarks_repository.dart';
import '../../../../data/pokeapi/pokeapi_repository.dart';
import '../../../../domain/models/pokemon_list_item.dart';
import '../../../../domain/result.dart';
import 'search_state.dart';

@injectable
class SearchCubit extends SafeCubit<SearchState> {
  SearchCubit(this._pokeapiRepository, this._bookmarksRepository)
      : super(const SearchState(isLoading: true)) {
    log('created');
    _subscribe();
    _sync();
  }

  static const _pageSize = 100;
  static const _searchDebounce = Duration(milliseconds: 300);

  final PokeapiRepository _pokeapiRepository;
  final BookmarksRepository _bookmarksRepository;
  StreamSubscription<List<PokemonListItem>>? _sub;
  Timer? _queryDebounce;
  int _limit = _pageSize;

  Future<void> _sync() async {
    log('sync start');
    final result = await _pokeapiRepository.syncAll();
    switch (result) {
      case Success(:final data):
        log('sync ok rows=$data');
      case Failure(:final error):
        log('sync failed', error: error);
        safeEmit(state.copyWith(error: error, isLoading: false));
    }
  }

  void _subscribe() {
    _sub?.cancel();
    final whitelistSize = state.weatherFilter?.ids.length;
    log('subscribe query="${state.query}" whitelist=$whitelistSize limit=$_limit');
    _sub = _pokeapiRepository
        .watchPokemon(
          query: state.query,
          idWhitelist: state.weatherFilter?.ids,
          offset: 0,
          limit: _limit,
        )
        .listen(
          (items) {
            final hasMax = items.length < _limit;
            log('stream emit count=${items.length} hasMax=$hasMax');
            safeEmit(
              state.copyWith(
                items: items,
                isLoading: false,
                isLoadingMore: false,
                hasReachedMax: hasMax,
                clearError: true,
              ),
            );
          },
          onError: (Object error) {
            log('stream error', error: error);
            safeEmit(
              state.copyWith(
                error: error,
                isLoading: false,
                isLoadingMore: false,
              ),
            );
          },
        );
  }

  void setQuery(String query) {
    _queryDebounce?.cancel();
    _queryDebounce = Timer(_searchDebounce, () => _applyQuery(query));
  }

  void _applyQuery(String query) {
    if (isClosed) return;
    if (query == state.query) return;
    log('applyQuery "$query"');
    _limit = _pageSize;
    safeEmit(state.copyWith(query: query, hasReachedMax: false));
    _subscribe();
  }

  Future<void> applyWeather({
    required double temperatureCelsius,
    double? windSpeedMps,
  }) async {
    log('applyWeather temp=$temperatureCelsius wind=$windSpeedMps');
    safeEmit(state.copyWith(isLoading: true, clearError: true));
    final result = await _pokeapiRepository.suggestByWeather(
      temperatureCelsius: temperatureCelsius,
      windSpeedMps: windSpeedMps,
    );
    switch (result) {
      case Success(:final data):
        log('weather ok type=${data.type} matches=${data.pokemon.length}');
        _limit = _pageSize;
        safeEmit(
          state.copyWith(
            weatherFilter: WeatherFilter(
              type: data.type,
              ids: data.pokemon.map((p) => p.id).toSet(),
            ),
            hasReachedMax: false,
          ),
        );
        _subscribe();
      case Failure(:final error):
        log('weather failed', error: error);
        safeEmit(state.copyWith(error: error, isLoading: false));
    }
  }

  void clearWeather() {
    if (state.weatherFilter == null) return;
    log('clearWeather');
    _limit = _pageSize;
    safeEmit(state.copyWith(clearWeatherFilter: true, hasReachedMax: false));
    _subscribe();
  }

  void loadMore() {
    if (state.isLoading ||
        state.isLoadingMore ||
        state.hasReachedMax ||
        state.error != null) {
      return;
    }
    log('loadMore limit=${_limit + _pageSize}');
    _limit += _pageSize;
    safeEmit(state.copyWith(isLoadingMore: true));
    _subscribe();
  }

  Future<void> toggleBookmark(PokemonListItem item) async {
    log('toggleBookmark id=${item.id}');
    await _bookmarksRepository.toggleBookmark(id: item.id);
  }

  Future<void> refresh() async {
    log('refresh');
    safeEmit(state.copyWith(clearError: true));
    final result = await _pokeapiRepository.syncAll(force: true);
    switch (result) {
      case Success(:final data):
        log('refresh ok rows=$data');
      case Failure(:final error):
        log('refresh failed', error: error);
        safeEmit(state.copyWith(error: error));
    }
  }

  @override
  Future<void> close() async {
    log('close');
    _queryDebounce?.cancel();
    await _sub?.cancel();
    return super.close();
  }
}