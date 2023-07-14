import 'base.dart';
import 'pokemon.dart';

class PokemonSpeciesVariety with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final bool isDefault;
  final PokemonResource pokemon;

  PokemonSpeciesVariety({
    required this.rawData,
    required this.isDefault,
    required this.pokemon,
  });

  factory PokemonSpeciesVariety.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesVariety(
      rawData: json,
      isDefault: json['is_default'],
      pokemon: PokemonResource.fromJson(json['pokemon']),
    );
  }
}

