import 'pokemon_list_item.dart';

class WeatherSuggestion {
  const WeatherSuggestion({required this.type, required this.pokemon});

  final String type;
  final List<PokemonListItem> pokemon;
}
