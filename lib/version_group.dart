import 'base.dart';
import 'move.dart';
import 'named_api_resource.dart';

class VersionGroup with ResourceBase {
  final int id;
  final String name;
  final int order;
  final NamedAPIResource generation;
  final List<MoveLearnMethodResource> moveLearnMethods;
  final List<NamedAPIResource> pokedexes;
  final List<NamedAPIResource> regions;
  final List<NamedAPIResource> versions;

  @override
  final Map<String, dynamic> rawData;

  VersionGroup({
    required this.id,
    required this.name,
    required this.order,
    required this.generation,
    required this.moveLearnMethods,
    required this.pokedexes,
    required this.regions,
    required this.versions,
    required this.rawData,
  });

  factory VersionGroup.fromJson(Map<String, dynamic> json) {
    return VersionGroup(
      id: json['id'],
      name: json['name'],
      order: json['order'],
      generation: NamedAPIResource.fromJson(json['generation']),
      moveLearnMethods:
          json['move_learn_methods'].map<MoveLearnMethodResource>((item) => NamedAPIResource.fromJson(item)).toList(),
      pokedexes: json['pokedexes'].map<NamedAPIResource>((item) => NamedAPIResource.fromJson(item)).toList(),
      regions: json['regions'].map<NamedAPIResource>((item) => NamedAPIResource.fromJson(item)).toList(),
      versions: json['versions'].map<NamedAPIResource>((item) => NamedAPIResource.fromJson(item)).toList(),
      rawData: json,
    );
  }
}

class VersionGroupResource extends NamedAPIResource<VersionGroup> {
  VersionGroupResource({
    required super.rawData,
    required super.name,
    required super.url,
  });

  factory VersionGroupResource.fromJson(Map<String, dynamic> json) {
    return VersionGroupResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  VersionGroup mapper(data) {
    return VersionGroup.fromJson(data);
  }
}

