import 'base.dart';
import 'named_api_resource.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'generation': generation.toJson(),
      'types': types.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'PokemonTypePast{generation: $generation, types: $types}';
  }
}

class PokemonType with ResourceBase {
  final int slot;
  final NamedAPIResource type;

  @override
  final Map<String, dynamic> rawData;

  PokemonType({
    required this.rawData,
    required this.slot,
    required this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      rawData: json,
      slot: json['slot'],
      type: NamedAPIResource.fromJson(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slot': slot,
      'type': type.toJson(),
    };
  }

  @override
  String toString() {
    return 'PokemonType{slot: $slot, type: $type}';
  }
}

