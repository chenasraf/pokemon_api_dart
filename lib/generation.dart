import 'base.dart';
import 'name.dart';
import 'named_api_resource.dart';

class Generation with ResourceBase {
  final int id;
  final String name;
  final List<NamedAPIResource> abilities;
  final List<Name> names;
  final NamedAPIResource mainRegion;
  final List<NamedAPIResource> moves;
  final List<NamedAPIResource> pokemonSpecies;
  final List<NamedAPIResource> types;
  final List<NamedAPIResource> versionGroups;

  @override
  final Map<String, dynamic> rawData;

  Generation({
    required this.rawData,
    required this.id,
    required this.name,
    required this.abilities,
    required this.names,
    required this.mainRegion,
    required this.moves,
    required this.pokemonSpecies,
    required this.types,
    required this.versionGroups,
  });

  factory Generation.fromJson(Map<String, dynamic> json) {
    return Generation(
      rawData: json,
      id: json['id'],
      name: json['name'],
      abilities: json['abilities'].map((e) => NamedAPIResource.fromJson(e)).toList(),
      names: json['names'].map((e) => Name.fromJson(e)).toList(),
      mainRegion: NamedAPIResource.fromJson(json['main_region']),
      moves: json['moves'].map((e) => NamedAPIResource.fromJson(e)).toList(),
      pokemonSpecies: json['pokemon_species'].map((e) => NamedAPIResource.fromJson(e)).toList(),
      types: json['types'].map((e) => NamedAPIResource.fromJson(e)).toList(),
      versionGroups: json['version_groups'].map((e) => NamedAPIResource.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'abilities': abilities.map((e) => e.toJson()).toList(),
        'names': names.map((e) => e.toJson()).toList(),
        'main_region': mainRegion.toJson(),
        'moves': moves.map((e) => e.toJson()).toList(),
        'pokemon_species': pokemonSpecies.map((e) => e.toJson()).toList(),
        'types': types.map((e) => e.toJson()).toList(),
        'version_groups': versionGroups.map((e) => e.toJson()).toList(),
      };
}

class GenerationResource extends NamedAPIResource<Generation> {
  GenerationResource({
    required super.url,
    required super.name,
    required super.rawData,
  });

  factory GenerationResource.fromJson(Map<String, dynamic> json) {
    return GenerationResource(
      rawData: json,
      url: json['url'],
      name: json['name'],
    );
  }

  @override
  Generation mapper(data) => Generation.fromJson(data);
}

