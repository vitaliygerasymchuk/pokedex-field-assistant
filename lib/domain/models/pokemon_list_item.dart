class PokemonListItem {
  const PokemonListItem({required this.id, required this.name});

  final int id;
  final String name;

  String get spriteUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
}