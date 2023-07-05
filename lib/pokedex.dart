import 'base.dart';
import 'description.dart';
import 'name.dart';
import 'named_api_resource.dart';
import 'pokemon_entry.dart';
import 'region.dart';

class Pokedex with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final int id;
  final String name;
  final List<Description> descriptions;
  final List<Name> names;
  final RegionResource region;
  final List<PokemonEntry> pokemonEntries;
  final List<NamedAPIResource> versionGroups;

  Pokedex({
    required this.rawData,
    required this.id,
    required this.name,
    required this.descriptions,
    required this.names,
    required this.region,
    required this.pokemonEntries,
    required this.versionGroups,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) {
    return Pokedex(
      rawData: json,
      id: json['id'],
      name: json['name'],
      descriptions: json['descriptions'].map((e) => Description.fromJson(e)).toList(),
      names: json['names'].map((e) => Name.fromJson(e)).toList(),
      region: RegionResource.fromJson(json['region']),
      pokemonEntries: json['pokemon_entries'].map((e) => PokemonEntry.fromJson(e)).toList(),
      versionGroups: json['version_groups'].map((e) => NamedAPIResource.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'descriptions': descriptions.map((e) => e.toJson()).toList(),
        'names': names.map((e) => e.toJson()).toList(),
        'region': region.toJson(),
        'pokemon_entries': pokemonEntries.map((e) => e.toJson()).toList(),
        'version_groups': versionGroups.map((e) => e.toJson()).toList(),
      };
}

