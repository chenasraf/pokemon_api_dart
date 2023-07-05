import 'base.dart';
import 'named_api_resource.dart';

class PokemonEntry with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final int entryNumber;
  final NamedAPIResource pokemonSpecies;

  PokemonEntry({
    required this.rawData,
    required this.entryNumber,
    required this.pokemonSpecies,
  });

  factory PokemonEntry.fromJson(Map<String, dynamic> json) {
    return PokemonEntry(
      rawData: json,
      entryNumber: json['entry_number'],
      pokemonSpecies: NamedAPIResource.fromJson(json['pokemon_species']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'entry_number': entryNumber,
        'pokemon_species': pokemonSpecies.toJson(),
      };
}

