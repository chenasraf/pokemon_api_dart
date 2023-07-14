import 'base.dart';
import 'generation_game_index.dart';
import 'name.dart';
import 'named_api_resource.dart';
import 'region.dart';

class Location with ResourceBase {
  final int id;
  final String name;
  final List<Name> names;
  final RegionResource region;
  final List<NamedAPIResource> areas;
  final List<GenerationGameIndex> gameIndices;
  @override
  final Map<String, dynamic> rawData;

  Location({
    required this.rawData,
    required this.id,
    required this.name,
    required this.names,
    required this.region,
    required this.areas,
    required this.gameIndices,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      rawData: json,
      id: json['id'],
      name: json['name'],
      names: json['names'].map<Name>((e) => Name.fromJson(e)).toList(),
      region: RegionResource.fromJson(json['region']),
      areas: json['areas'].map<NamedAPIResource>((e) => NamedAPIResource.fromJson(e)).toList(),
      gameIndices: json['game_indices'].map<GenerationGameIndex>((e) => GenerationGameIndex.fromJson(e)).toList(),
    );
  }
}

class LocationResource extends NamedAPIResource<Location> {
  LocationResource({required super.rawData, required super.name, required super.url});
  factory LocationResource.fromJson(Map<String, dynamic> json) {
    return LocationResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  Location mapper(data) => Location.fromJson(data);
}

