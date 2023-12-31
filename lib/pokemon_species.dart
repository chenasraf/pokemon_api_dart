import 'base.dart';
import 'description.dart';
import 'flavor_text.dart';
import 'genus.dart';
import 'name.dart';
import 'named_api_resource.dart';
import 'pal_park_encounter_area.dart';
import 'pokedex_number.dart';
import 'pokemon_species_variety.dart';

class PokemonSpecies with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final int? baseHappiness;
  final int captureRate;
  final NamedAPIResource? color;
  final List<NamedAPIResource> eggGroups;
  final NamedAPIResource? evolutionChain;
  final NamedAPIResource? evolvesFromSpecies;
  final List<FlavorText> flavorTextEntries;
  final List<Description> formDescriptions;
  final bool formsSwitchable;
  final int? genderRate;
  final List<Genus> genera;
  final NamedAPIResource generation;
  final NamedAPIResource growthRate;
  final NamedAPIResource? habitat;
  final bool hasGenderDifferences;
  final int? hatchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final List<Name> names;
  final int order;
  final List<PalParkEncounterArea> palParkEncounters;
  final List<PokedexNumber> pokedexNumbers;
  final NamedAPIResource? shape;
  final List<PokemonSpeciesVariety> varieties;

  PokemonSpecies({
    required this.rawData,
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
        rawData: json,
        baseHappiness: json['base_happiness'],
        captureRate: json['capture_rate'],
        color: json['color'] != null && json['color'].isNotEmpty ? NamedAPIResource.fromJson(json['color']) : null,
        eggGroups: json['egg_groups'] != null
            ? List<NamedAPIResource>.from(json['egg_groups'].map((x) => NamedAPIResource.fromJson(x)))
            : [],
        evolutionChain: json['evolution_chain'] != null && json['evolution_chain'].isNotEmpty
            ? NamedAPIResource.fromJson({...json['evolution_chain'], 'name': 'evolution-chain'})
            : null,
        evolvesFromSpecies: json['evolves_from_species'] != null && json['evolves_from_species'].isNotEmpty
            ? NamedAPIResource.fromJson(json['evolves_from_species'])
            : null,
        flavorTextEntries: json['flavor_text_entries'] != null
            ? List<FlavorText>.from(json['flavor_text_entries'].map((x) => FlavorText.fromJson(x)))
            : [],
        formDescriptions: json['form_descriptions'] != null
            ? List<Description>.from(json['form_descriptions'].map((x) => Description.fromJson(x)))
            : [],
        formsSwitchable: json['forms_switchable'],
        genderRate: json['gender_rate'],
        genera: json['genera'] != null ? List<Genus>.from(json['genera'].map((x) => Genus.fromJson(x))) : [],
        generation: NamedAPIResource.fromJson(json['generation']),
        growthRate: NamedAPIResource.fromJson(json['growth_rate']),
        habitat:
            json['habitat'] != null && json['habitat'].isNotEmpty ? NamedAPIResource.fromJson(json['habitat']) : null,
        hasGenderDifferences: json['has_gender_differences'],
        hatchCounter: json['hatch_counter'],
        id: json['id'],
        isBaby: json['is_baby'],
        isLegendary: json['is_legendary'],
        isMythical: json['is_mythical'],
        name: json['name'],
        names: json['names'] != null ? List<Name>.from(json['names'].map((x) => Name.fromJson(x))) : [],
        order: json['order'],
        palParkEncounters: json['pal_park_encounters'] != null
            ? List<PalParkEncounterArea>.from(json['pal_park_encounters'].map((x) => PalParkEncounterArea.fromJson(x)))
            : [],
        pokedexNumbers: json['pokedex_numbers'] != null
            ? List<PokedexNumber>.from(json['pokedex_numbers'].map((x) => PokedexNumber.fromJson(x)))
            : [],
        shape: json['shape'] != null && json['shape'].isNotEmpty ? NamedAPIResource.fromJson(json['shape']) : null,
        varieties: json['varieties'] != null
            ? List<PokemonSpeciesVariety>.from(json['varieties'].map((x) => PokemonSpeciesVariety.fromJson(x)))
            : [],
      );
}

class PokemonSpeciesResource extends NamedAPIResource<PokemonSpecies> {
  PokemonSpeciesResource({required super.rawData, required super.name, required super.url});

  factory PokemonSpeciesResource.fromJson(Map<String, dynamic> json) =>
      PokemonSpeciesResource(rawData: json, name: json['name'], url: json['url']);

  @override
  PokemonSpecies mapper(data) {
    return PokemonSpecies.fromJson(data);
  }

  @override
  String toString() => 'PokemonSpeciesResource{name: $name, url: $url}';
}

