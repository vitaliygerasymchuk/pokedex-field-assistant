class PokemonListItem {
  const PokemonListItem({
    required this.id,
    required this.name,
    this.isBookmarked = false,
  });

  final int id;
  final String name;
  final bool isBookmarked;

  String get spriteUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}