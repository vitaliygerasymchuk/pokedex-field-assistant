import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/pokeapi/pokeapi_repository.dart';
import '../../domain/models/pokemon_details.dart';
import '../../domain/result.dart';
import 'pokemon_details_state.dart';

@injectable
class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit(this._repo, @factoryParam this._id)
      : super(const PokemonDetailsState()) {
    _log('created id=$_id');
    _subscribe();
    _sync();
  }

  static const _tag = 'PokemonDetailsCubit';

  final PokeapiRepository _repo;
  final int _id;
  StreamSubscription<PokemonDetails?>? _sub;

  void _safeEmit(PokemonDetailsState next) {
    if (isClosed) return;
    emit(next);
  }

  void _subscribe() {
    _sub?.cancel();
    _sub = _repo.watchDetails(_id).listen(
      (details) {
        if (isClosed) return;
        _log('stream emit hasData=${details != null}');
        _safeEmit(
          state.copyWith(
            details: details,
            isLoading: details == null ? state.isLoading : false,
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

  Future<void> _sync() async {
    _log('sync');
    final result = await _repo.syncDetails(_id);
    if (isClosed) return;
    switch (result) {
      case Success():
        _log('sync ok');
      case Failure(:final error):
        _log('sync failed', error: error);
        _safeEmit(state.copyWith(error: error, isLoading: false));
    }
  }

  Future<void> refresh() async {
    _log('refresh');
    _safeEmit(state.copyWith(clearError: true));
    final result = await _repo.syncDetails(_id, force: true);
    if (isClosed) return;
    if (result case Failure(:final error)) {
      _log('refresh failed', error: error);
      _safeEmit(state.copyWith(error: error));
    }
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