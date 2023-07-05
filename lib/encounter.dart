import 'base.dart';
import 'name.dart';
import 'named_api_resource.dart';
import 'pokemon.dart';

class PokemonEncounter with ResourceBase {
  final PokemonResource pokemon;
  final List<VersionEncounterDetail> versionDetails;

  @override
  final Map<String, dynamic> rawData;

  PokemonEncounter({
    required this.rawData,
    required this.pokemon,
    required this.versionDetails,
  });

  factory PokemonEncounter.fromJson(Map<String, dynamic> json) {
    return PokemonEncounter(
      rawData: json,
      pokemon: PokemonResource.fromJson(json['pokemon']),
      versionDetails:
          json['version_details'].map<VersionEncounterDetail>((e) => VersionEncounterDetail.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pokemon': pokemon.toJson(),
      'version_details': versionDetails.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'PokemonEncounter{pokemon: $pokemon, versionDetails: $versionDetails}';
  }
}

class Encounter with ResourceBase {
  final int chance;
  final List<NamedAPIResource> conditionValues;
  final int maxLevel;
  final NamedAPIResource method;
  final int minLevel;
  @override
  final Map<String, dynamic> rawData;

  Encounter({
    required this.rawData,
    required this.chance,
    required this.conditionValues,
    required this.maxLevel,
    required this.method,
    required this.minLevel,
  });

  factory Encounter.fromJson(Map<String, dynamic> json) {
    return Encounter(
      rawData: json,
      chance: json['chance'],
      conditionValues: json['condition_values'].map<NamedAPIResource>((e) => NamedAPIResource.fromJson(e)).toList(),
      maxLevel: json['max_level'],
      method: NamedAPIResource.fromJson(json['method']),
      minLevel: json['min_level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chance': chance,
      'condition_values': conditionValues.map((e) => e.toJson()).toList(),
      'max_level': maxLevel,
      'method': method.toJson(),
      'min_level': minLevel,
    };
  }

  @override
  String toString() {
    return 'EncounterDetail{chance: $chance, conditionValues: $conditionValues, maxLevel: $maxLevel, method: $method, minLevel: $minLevel}';
  }
}

class VersionEncounterDetail with ResourceBase {
  /// The chance of an encounter to occur.
  final int maxChance;

  /// The version relevent to this encounter detail
  final NamedAPIResource version;

  /// A list of encounters and their specifics.
  final List<Encounter> encounterDetails;

  @override
  final Map<String, dynamic> rawData;

  VersionEncounterDetail({
    required this.rawData,
    required this.maxChance,
    required this.version,
    required this.encounterDetails,
  });

  factory VersionEncounterDetail.fromJson(Map<String, dynamic> json) {
    return VersionEncounterDetail(
      rawData: json,
      maxChance: json['max_chance'],
      version: NamedAPIResource.fromJson(json['version']),
      encounterDetails: json['encounter_details'].map<Encounter>((e) => Encounter.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'max_chance': maxChance,
      'version': version.toJson(),
      'encounter_details': encounterDetails.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'LocationAreaVersionDetails{maxChance: $maxChance, version: $version, encounterDetails: $encounterDetails}';
  }
}

class EncounterMethod with ResourceBase {
  final int id;
  final List<Name> names;
  final List<NamedAPIResource> order;
  @override
  final Map<String, dynamic> rawData;

  EncounterMethod({
    required this.rawData,
    required this.id,
    required this.names,
    required this.order,
  });

  factory EncounterMethod.fromJson(Map<String, dynamic> json) {
    return EncounterMethod(
      rawData: json,
      id: json['id'],
      names: json['names'].map<Name>((e) => Name.fromJson(e)).toList(),
      order: json['order'].map<NamedAPIResource>((e) => NamedAPIResource.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'names': names.map((e) => e.toJson()).toList(),
      'order': order.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'EncounterMethod{names: $names, order: $order}';
  }
}

class EncounterMethodRate with ResourceBase {
  /// The method in which Pokémon may be encountered in an area.
  final NamedAPIResource encounterMethod;

  /// The chance of the encounter to occur on a version of the game.
  final List<EncounterVersionDetails> versionDetails;
  @override
  final Map<String, dynamic> rawData;

  EncounterMethodRate({
    required this.rawData,
    required this.encounterMethod,
    required this.versionDetails,
  });

  factory EncounterMethodRate.fromJson(Map<String, dynamic> json) {
    return EncounterMethodRate(
      rawData: json,
      encounterMethod: NamedAPIResource.fromJson(json['encounter_method']),
      versionDetails:
          json['version_details'].map<EncounterVersionDetails>((e) => EncounterVersionDetails.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'encounter_method': encounterMethod.toJson(),
      'version_details': versionDetails.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'EncounterMethodRate{encounterMethod: $encounterMethod, versionDetails: $versionDetails}';
  }
}

class EncounterVersionDetails with ResourceBase {
  /// The chance of an encounter to occur.
  final int rate;

  /// The version of the game in which the encounter can occur with the given chance.
  final NamedAPIResource version;
  @override
  final Map<String, dynamic> rawData;

  EncounterVersionDetails({
    required this.rawData,
    required this.rate,
    required this.version,
  });

  factory EncounterVersionDetails.fromJson(Map<String, dynamic> json) {
    return EncounterVersionDetails(
      rawData: json,
      rate: json['rate'],
      version: NamedAPIResource.fromJson(json['version']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'version': version.toJson(),
    };
  }

  @override
  String toString() {
    return 'EncounterVersionDetails{rate: $rate, version: $version}';
  }
}
