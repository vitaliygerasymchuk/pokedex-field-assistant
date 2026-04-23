class PokemonDetails {
  const PokemonDetails({
    required this.id,
    required this.name,
    required this.spriteUrl,
    required this.types,
    required this.heightDm,
    required this.weightHg,
    required this.abilities,
    required this.stats,
  });

  final int id;
  final String name;
  final String spriteUrl;
  final List<String> types;
  final int heightDm;
  final int weightHg;
  final List<String> abilities;
  final Map<String, int> stats;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    final sprites = json['sprites'] as Map<String, dynamic>? ?? const {};
    final other = sprites['other'] as Map<String, dynamic>? ?? const {};
    final official = other['official-artwork'] as Map<String, dynamic>? ?? const {};
    final artwork = official['front_default'] as String?;
    final fallback = sprites['front_default'] as String?;

    final rawTypes = (json['types'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>()
        .toList()
      ..sort((a, b) => (a['slot'] as int).compareTo(b['slot'] as int));
    final types = rawTypes
        .map((e) => (e['type'] as Map<String, dynamic>)['name'] as String)
        .toList();

    final abilities = (json['abilities'] as List<dynamic>? ?? const [])
        .map((e) => (e as Map<String, dynamic>)['ability'] as Map<String, dynamic>)
        .map((a) => a['name'] as String)
        .toList();

    final stats = <String, int>{
      for (final e in (json['stats'] as List<dynamic>? ?? const []))
        ((e as Map<String, dynamic>)['stat'] as Map<String, dynamic>)['name'] as String:
            e['base_stat'] as int,
    };

    return PokemonDetails(
      id: json['id'] as int,
      name: json['name'] as String,
      spriteUrl: artwork ?? fallback ?? '',
      types: types,
      heightDm: json['height'] as int? ?? 0,
      weightHg: json['weight'] as int? ?? 0,
      abilities: abilities,
      stats: stats,
    );
  }
}