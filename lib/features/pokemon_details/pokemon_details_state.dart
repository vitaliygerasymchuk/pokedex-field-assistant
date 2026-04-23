import '../../domain/models/pokemon_details.dart';

class PokemonDetailsState {
  const PokemonDetailsState({
    this.details,
    this.isLoading = true,
    this.error,
  });

  final PokemonDetails? details;
  final bool isLoading;
  final Object? error;

  PokemonDetailsState copyWith({
    PokemonDetails? details,
    bool? isLoading,
    Object? error,
    bool clearError = false,
  }) {
    return PokemonDetailsState(
      details: details ?? this.details,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}