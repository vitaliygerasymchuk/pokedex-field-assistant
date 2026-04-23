import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../core/safe_cubit.dart';
import '../../data/pokeapi/pokeapi_repository.dart';
import '../../domain/models/pokemon_details.dart';
import '../../domain/result.dart';
import 'pokemon_details_state.dart';

@injectable
class PokemonDetailsCubit extends SafeCubit<PokemonDetailsState> {
  PokemonDetailsCubit(this._repo, @factoryParam this._id)
      : super(const PokemonDetailsState()) {
    log('created id=$_id');
    _subscribe();
    _sync();
  }

  final PokeapiRepository _repo;
  final int _id;
  StreamSubscription<PokemonDetails?>? _sub;

  void _subscribe() {
    _sub?.cancel();
    _sub = _repo.watchDetails(_id).listen(
      (details) {
        log('stream emit hasData=${details != null}');
        safeEmit(
          state.copyWith(
            details: details,
            isLoading: details == null ? state.isLoading : false,
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

  Future<void> _sync() async {
    log('sync');
    final result = await _repo.syncDetails(_id);
    switch (result) {
      case Success():
        log('sync ok');
      case Failure(:final error):
        log('sync failed', error: error);
        safeEmit(state.copyWith(error: error, isLoading: false));
    }
  }

  Future<void> refresh() async {
    log('refresh');
    safeEmit(state.copyWith(clearError: true));
    final result = await _repo.syncDetails(_id, force: true);
    if (result case Failure(:final error)) {
      log('refresh failed', error: error);
      safeEmit(state.copyWith(error: error));
    }
  }

  @override
  Future<void> close() async {
    log('close');
    await _sub?.cancel();
    return super.close();
  }
}