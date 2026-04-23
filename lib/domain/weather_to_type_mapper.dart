import 'package:injectable/injectable.dart';

@lazySingleton
class WeatherToTypeMapper {
  const WeatherToTypeMapper();

  static const gameplayTypes = <String>{
    'normal',
    'fighting',
    'flying',
    'poison',
    'ground',
    'rock',
    'bug',
    'ghost',
    'steel',
    'fire',
    'water',
    'grass',
    'electric',
    'psychic',
    'ice',
    'dragon',
    'dark',
    'fairy',
  };

  String pick({required double temperatureCelsius, double? windSpeedMps}) {
    if (windSpeedMps != null && windSpeedMps > 10) return 'flying';
    if (temperatureCelsius > 25) return 'fire';
    if (temperatureCelsius > 15) return 'grass';
    if (temperatureCelsius > 5) return 'water';
    return 'ice';
  }
}
