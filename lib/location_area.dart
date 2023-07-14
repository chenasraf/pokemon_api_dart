import 'base.dart';
import 'encounter.dart';
import 'location.dart';
import 'name.dart';
import 'named_api_resource.dart';

class PokemonLocationArea with ResourceBase {
  final LocationAreaResource locationArea;
  final List<VersionEncounterDetail> versionDetails;
  @override
  final Map<String, dynamic> rawData;

  PokemonLocationArea({
    required this.rawData,
    required this.locationArea,
    required this.versionDetails,
  });

  factory PokemonLocationArea.fromJson(Map<String, dynamic> json) {
    return PokemonLocationArea(
      rawData: json,
      locationArea: LocationAreaResource.fromJson(json['location_area']),
      versionDetails:
          json['version_details'].map<VersionEncounterDetail>((e) => VersionEncounterDetail.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'location_area': locationArea.toJson(),
      'version_details': versionDetails.map((e) => e.toJson()).toList(),
    };
  }
}

class LocationArea with ResourceBase {
  final int gameIndex;
  final LocationResource location;
  final List<Name> names;
  final List<PokemonEncounter> pokemonEncounters;
  final List<EncounterMethodRate> encounterMethodRates;
  @override
  final Map<String, dynamic> rawData;

  LocationArea({
    required this.rawData,
    required this.gameIndex,
    required this.location,
    required this.names,
    required this.pokemonEncounters,
    required this.encounterMethodRates,
  });

  factory LocationArea.fromJson(Map<String, dynamic> json) {
    return LocationArea(
      rawData: json,
      gameIndex: json['game_index'],
      location: LocationResource.fromJson(json['location']),
      names: json['names'].map<Name>((e) => Name.fromJson(e)).toList(),
      pokemonEncounters: json['pokemon_encounters'].map<PokemonEncounter>((e) => PokemonEncounter.fromJson(e)).toList(),
      encounterMethodRates:
          json['encounter_method_rates'].map<EncounterMethodRate>((e) => EncounterMethodRate.fromJson(e)).toList(),
    );
  }
}

class PokemonLocationAreaResource extends APIResource<List<PokemonLocationArea>> {
  PokemonLocationAreaResource({required super.rawData, required super.url});
  factory PokemonLocationAreaResource.fromJson(Map<String, dynamic> json) {
    return PokemonLocationAreaResource(
      rawData: json,
      url: json['url'],
    );
  }

  @override
  List<PokemonLocationArea> mapper(data) => (data as List).map((e) => PokemonLocationArea.fromJson(e)).toList();
}

class LocationAreaResource extends NamedAPIResource<LocationArea> {
  LocationAreaResource({required super.rawData, required super.name, required super.url});
  factory LocationAreaResource.fromJson(Map<String, dynamic> json) {
    return LocationAreaResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  LocationArea mapper(data) => LocationArea.fromJson(data);
}

