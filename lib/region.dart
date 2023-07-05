import 'base.dart';
import 'generation.dart';
import 'location.dart';
import 'name.dart';
import 'named_api_resource.dart';

class Region with ResourceBase {
  final int id;
  final String name;
  final List<LocationResource> locations;
  final List<Name> names;
  final GenerationResource mainGeneration;
  final List<NamedAPIResource> pokedexes;
  final List<NamedAPIResource> versionGroups;
  @override
  final Map<String, dynamic> rawData;

  Region({
    required this.rawData,
    required this.id,
    required this.name,
    required this.locations,
    required this.names,
    required this.mainGeneration,
    required this.pokedexes,
    required this.versionGroups,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      rawData: json,
      id: json['id'],
      name: json['name'],
      locations: json['locations'].map<LocationResource>((e) => LocationResource.fromJson(e)).toList(),
      names: json['names'].map<Name>((e) => Name.fromJson(e)).toList(),
      mainGeneration: GenerationResource.fromJson(json['main_generation']),
      pokedexes: json['pokedexes'].map<NamedAPIResource>((e) => NamedAPIResource.fromJson(e)).toList(),
      versionGroups: json['version_groups'].map<NamedAPIResource>((e) => NamedAPIResource.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'locations': locations.map((e) => e.toJson()).toList(),
      'names': names.map((e) => e.toJson()).toList(),
      'main_generation': mainGeneration.toJson(),
      'pokedexes': pokedexes.map((e) => e.toJson()).toList(),
      'version_groups': versionGroups.map((e) => e.toJson()).toList(),
    };
  }
}

class RegionResource extends NamedAPIResource<Region> {
  RegionResource({required super.rawData, required super.name, required super.url});
  factory RegionResource.fromJson(Map<String, dynamic> json) {
    return RegionResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  Region mapper(data) => Region.fromJson(data);
}

