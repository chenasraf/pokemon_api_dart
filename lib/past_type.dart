import 'base.dart';
import 'named_api_resource.dart';
import 'type.dart';

class PokemonTypePast with ResourceBase {
  final NamedAPIResource generation;
  final List<PokemonType> types;
  @override
  final Map<String, dynamic> rawData;

  PokemonTypePast({
    required this.rawData,
    required this.generation,
    required this.types,
  });

  factory PokemonTypePast.fromJson(Map<String, dynamic> json) {
    return PokemonTypePast(
      rawData: json,
      generation: NamedAPIResource.fromJson(json['generation']),
      types: json['types'].map<PokemonType>((e) => PokemonType.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'generation': generation.toJson(),
      'types': types.map((e) => e.toJson()).toList(),
    };
  }
}

