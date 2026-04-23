import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/bookmarks/bookmarks_repository.dart';
import '../../../../data/pokeapi/pokeapi_repository.dart';
import '../../../../domain/models/pokemon_list_item.dart';
import '../../../../domain/result.dart';
import 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._pokeapiRepository, this._bookmarksRepository)
      : super(const SearchState(isLoading: true)) {
    _log('created');
    _subscribe();
    _sync();
  }

  static const _tag = 'SearchCubit';
  static const _pageSize = 100;
  static const _searchDebounce = Duration(milliseconds: 300);

  final PokeapiRepository _pokeapiRepository;
  final BookmarksRepository _bookmarksRepository;
  StreamSubscription<List<PokemonListItem>>? _sub;
  Timer? _queryDebounce;
  int _limit = _pageSize;

  void _safeEmit(SearchState next) {
    if (isClosed) return;
    emit(next);
  }

  Future<void> _sync() async {
    _log('sync start');
    final result = await _pokeapiRepository.syncAll();
    switch (result) {
      case Success(:final data):
        _log('sync ok rows=$data');
      case Failure(:final error):
        _log('sync failed', error: error);
        _safeEmit(state.copyWith(error: error, isLoading: false));
    }
  }

  void _subscribe() {
    _sub?.cancel();
    final whitelistSize = state.weatherFilter?.ids.length;
    _log('subscribe query="${state.query}" whitelist=$whitelistSize limit=$_limit');
    _sub = _pokeapiRepository
        .watchPokemon(
          query: state.query,
          idWhitelist: state.weatherFilter?.ids,
          offset: 0,
          limit: _limit,
        )
        .listen(
          (items) {
            if (isClosed) return;
            final hasMax = items.length < _limit;
            _log('stream emit count=${items.length} hasMax=$hasMax');
            _safeEmit(
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
            if (isClosed) return;
            _log('stream error', error: error);
            _safeEmit(
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
    _log('applyQuery "$query"');
    _limit = _pageSize;
    _safeEmit(state.copyWith(query: query, hasReachedMax: false));
    _subscribe();
  }

  Future<void> applyWeather({
    required double temperatureCelsius,
    double? windSpeedMps,
  }) async {
    _log('applyWeather temp=$temperatureCelsius wind=$windSpeedMps');
    _safeEmit(state.copyWith(isLoading: true, clearError: true));
    final result = await _pokeapiRepository.suggestByWeather(
      temperatureCelsius: temperatureCelsius,
      windSpeedMps: windSpeedMps,
    );
    switch (result) {
      case Success(:final data):
        _log('weather ok type=${data.type} matches=${data.pokemon.length}');
        _limit = _pageSize;
        _safeEmit(
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
        _log('weather failed', error: error);
        _safeEmit(state.copyWith(error: error, isLoading: false));
    }
  }

  void clearWeather() {
    if (state.weatherFilter == null) return;
    _log('clearWeather');
    _limit = _pageSize;
    _safeEmit(state.copyWith(clearWeatherFilter: true, hasReachedMax: false));
    _subscribe();
  }

  void loadMore() {
    if (state.isLoading ||
        state.isLoadingMore ||
        state.hasReachedMax ||
        state.error != null) {
      return;
    }
    _log('loadMore limit=${_limit + _pageSize}');
    _limit += _pageSize;
    _safeEmit(state.copyWith(isLoadingMore: true));
    _subscribe();
  }

  Future<void> toggleBookmark(PokemonListItem item) async {
    _log('toggleBookmark id=${item.id}');
    await _bookmarksRepository.toggleBookmark(id: item.id);
  }

  Future<void> refresh() async {
    _log('refresh');
    _safeEmit(state.copyWith(clearError: true));
    final result = await _pokeapiRepository.syncAll(force: true);
    if (isClosed) return;
    switch (result) {
      case Success(:final data):
        _log('refresh ok rows=$data');
      case Failure(:final error):
        _log('refresh failed', error: error);
        _safeEmit(state.copyWith(error: error));
    }
  }

  @override
  Future<void> close() async {
    _log('close');
    _queryDebounce?.cancel();
    await _sub?.cancel();
    return super.close();
  }

  void _log(String message, {Object? error}) {
    developer.log(message, name: _tag, error: error);
  }
}