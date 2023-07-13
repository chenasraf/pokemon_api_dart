import 'ability.dart';
import 'base.dart';
import 'held_item.dart';
import 'location_area.dart';
import 'move.dart';
import 'named_api_resource.dart';
import 'past_type.dart';
import 'stat.dart';
import 'type.dart';
import 'sprites.dart';
import 'version_game_index.dart';

class Pokemon with ResourceBase {
  /// Universal name of the pokemon
  final String name;

  /// Pokemon ID
  final int id;

  /// Height of the pokemon in decimeters
  final int height;

  /// Weight of the pokemon in hectograms
  final int weight;

  /// Base experience gained when defeating this pokemon
  final int? baseExperience;

  /// Whether this is the default form of this pokemon
  final bool isDefault;

  /// Order for sorting. Almost national order, except families are grouped together
  final int order;

  /// Abilities this pokemon could potentially have
  final List<PokemonAbility> abilities;

  /// Forms this pokemon can take on
  final List<NamedAPIResource> forms;

  /// Game indices relevent to pokemon item by generation
  final List<VersionGameIndex> gameIndices;

  /// Items this pokemon may be holding when encountered
  final List<PokemonHeldItem> heldItems;

  /// A resource linked to a list of location areas, as well as encounter details pertaining to specific versions
  final PokemonLocationAreaResource locationAreaEncounters;

  /// Moves this pokemon can learn
  final List<PokemonMove> moves;

  /// Types this pokemon has had
  final List<PokemonTypePast> pastTypes;

  /// Sprites of the pokemon
  final PokemonAllSprites sprites;

  /// The species this pokemon belongs to
  final NamedAPIResource species;

  /// Base stats for this pokemon
  final List<PokemonStat> stats;

  /// The types of this pokemon
  final List<PokemonType> types;

  @override
  final Map<String, dynamic> rawData;

  Pokemon({
    required this.rawData,
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      rawData: json,
      name: json['name'],
      id: json['id'],
      height: json['height'],
      weight: json['weight'],
      isDefault: json['is_default'],
      order: json['order'],
      abilities: json['abilities'].map<PokemonAbility>((e) => PokemonAbility.fromJson(e)).toList(),
      baseExperience: json['base_experience'],
      forms: json['forms'].map<NamedAPIResource>((e) => NamedAPIResource.fromJson(e)).toList(),
      gameIndices: json['game_indices'].map<VersionGameIndex>((e) => VersionGameIndex.fromJson(e)).toList(),
      heldItems: json['held_items'].map<PokemonHeldItem>((e) => PokemonHeldItem.fromJson(e)).toList(),
      locationAreaEncounters: PokemonLocationAreaResource.fromJson({'url': json['location_area_encounters']}),
      moves: json['moves'].map<PokemonMove>((e) => PokemonMove.fromJson(e)).toList(),
      pastTypes: json['past_types'].map<PokemonTypePast>((e) => PokemonTypePast.fromJson(e)).toList(),
      sprites: PokemonAllSprites.fromJson(json['sprites']),
      species: NamedAPIResource.fromJson(json['species']),
      stats: json['stats'].map<PokemonStat>((e) => PokemonStat.fromJson(e)).toList(),
      types: json['types'].map<PokemonType>((e) => PokemonType.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'height': height,
      'weight': weight,
      'is_default': isDefault,
      'order': order,
      'abilities': abilities,
      'base_experience': baseExperience,
      'forms': forms.map((e) => e.toJson()).toList(),
      'game_indices': gameIndices.map((e) => e.toJson()).toList(),
      'held_items': heldItems.map((e) => e.toJson()).toList(),
      'location_area_encounters': locationAreaEncounters.url,
      'moves': moves.map((e) => e.toJson()).toList(),
      'past_types': pastTypes.map((e) => e.toJson()).toList(),
      'sprites': sprites.toJson(),
      'species': species.toJson(),
      'stats': stats.map((e) => e.toJson()).toList(),
      'types': types.map((e) => e.toJson()).toList(),
    };
  }
}

class PokemonResource extends NamedAPIResource<Pokemon> {
  PokemonResource({required super.rawData, required super.name, required super.url});
  factory PokemonResource.fromJson(Map<String, dynamic> json) {
    return PokemonResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  Pokemon mapper(data) => Pokemon.fromJson(data);
}

