import 'ability.dart';
import 'base.dart';
import 'description.dart';
import 'flavor_text.dart';
import 'name.dart';
import 'named_api_resource.dart';
import 'type.dart';
import 'version_group.dart';

class PokemonMove with ResourceBase {
  final MoveResource? move;
  final List<PokemonMoveVersion> versionGroupDetails;
  @override
  final Map<String, dynamic> rawData;

  PokemonMove({
    required this.rawData,
    required this.move,
    required this.versionGroupDetails,
  });

  factory PokemonMove.fromJson(Map<String, dynamic> json) {
    return PokemonMove(
      rawData: json,
      move: json['move'] != null ? MoveResource.fromJson(json['move']) : null,
      versionGroupDetails:
          ((json['version_group_details'] ?? []) as List<dynamic>).map((e) => PokemonMoveVersion.fromJson(e)).toList(),
    );
  }
}

class Move with ResourceBase {
  final int id;
  final String name;
  final int? accuracy;
  final int? effectChance;
  final int pp;
  final int priority;
  final int? power;
  final dynamic contestCombos;
  final NamedAPIResource? contestType;
  final APIResource? contestEffect;
  final NamedAPIResource? damageClass;
  final List<VerboseEffect> effectEntries;
  final List<AbilityEffectChange> effectChanges;
  final List<MoveFlavorText> flavorTextEntries;
  final NamedAPIResource? generation;
  final List<dynamic> machines;
  final dynamic metaData;
  final List<Name> names;
  final PastMoveStatValues pastValues;
  final List<dynamic> statChanges;
  final NamedAPIResource superContestEffect;
  final NamedAPIResource? target;
  final NamedAPIResource? type;

  @override
  final Map<String, dynamic> rawData;

  Move({
    required this.rawData,
    required this.id,
    required this.name,
    required this.accuracy,
    required this.effectChance,
    required this.pp,
    required this.priority,
    required this.power,
    required this.contestCombos,
    required this.contestType,
    required this.contestEffect,
    required this.damageClass,
    required this.effectEntries,
    required this.effectChanges,
    required this.flavorTextEntries,
    required this.generation,
    required this.machines,
    required this.metaData,
    required this.names,
    required this.pastValues,
    required this.statChanges,
    required this.superContestEffect,
    required this.target,
    required this.type,
  });

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      rawData: json,
      id: json['id'],
      name: json['name'],
      accuracy: json['accuracy'],
      effectChance: json['effect_chance'],
      pp: json['pp'],
      priority: json['priority'],
      power: json['power'],
      contestCombos: json['contest_combos'],
      contestType: json['contest_type'] != null ? NamedAPIResource.fromJson(json['contest_type']) : null,
      contestEffect: json['contest_effect'] != null ? APIResource.fromJson(json['contest_effect']) : null,
      damageClass: json['damage_class'] != null ? NamedAPIResource.fromJson(json['damage_class']) : null,
      effectEntries: (json['effect_entries'] as List<dynamic>).map((e) => VerboseEffect.fromJson(e)).toList(),
      effectChanges: (json['effect_changes'] as List<dynamic>).map((e) => AbilityEffectChange.fromJson(e)).toList(),
      flavorTextEntries: json['flavor_text_entries'] != null
          ? (json['flavor_text_entries'] as List<dynamic>).map((e) => MoveFlavorText.fromJson(e)).toList()
          : [],
      generation: json['generation'] != null ? NamedAPIResource.fromJson(json['generation']) : null,
      machines: json['machines'],
      metaData: json['meta'],
      names: (json['names'] as List<dynamic>).map((e) => Name.fromJson(e)).toList(),
      pastValues: PastMoveStatValues.fromJson(json['past_values']),
      statChanges: json['stat_changes'],
      superContestEffect: NamedAPIResource.fromJson(json['super_contest_effect']),
      target: json['target'] != null ? NamedAPIResource.fromJson(json['target']) : null,
      type: json['type'] != null ? NamedAPIResource.fromJson(json['type']) : null,
    );
  }

}

class MoveResource extends NamedAPIResource<Move> {
  MoveResource({required super.name, required super.url, required super.rawData});

  factory MoveResource.fromJson(Map<String, dynamic> json) {
    return MoveResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  Move mapper(data) => Move.fromJson(data);
}

class PokemonMoveResource extends NamedAPIResource<PokemonMove> {
  PokemonMoveResource({required super.name, required super.url, required super.rawData});

  factory PokemonMoveResource.fromJson(Map<String, dynamic> json) {
    return PokemonMoveResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  PokemonMove mapper(data) => PokemonMove.fromJson(data);
}

class PokemonMoveVersion with ResourceBase {
  final VersionGroupResource? versionGroup;
  final int? levelLearnedAt;
  final MoveLearnMethodResource? moveLearnMethod;
  @override
  final Map<String, dynamic> rawData;

  PokemonMoveVersion({
    required this.rawData,
    required this.versionGroup,
    required this.levelLearnedAt,
    required this.moveLearnMethod,
  });

  factory PokemonMoveVersion.fromJson(Map<String, dynamic> json) {
    return PokemonMoveVersion(
      rawData: json,
      versionGroup: json['version_group'] != null ? VersionGroupResource.fromJson(json['version_group']) : null,
      levelLearnedAt: json['level_learned_at'],
      moveLearnMethod:
          json['move_learn_method'] != null ? MoveLearnMethodResource.fromJson(json['move_learn_method']) : null,
    );
  }
}

class MoveLearnMethod with ResourceBase {
  final int id;
  final String name;
  final List<Name> names;
  final List<NamedAPIResource> versionGroups;
  final List<Description> descriptions;

  @override
  final Map<String, dynamic> rawData;

  MoveLearnMethod({
    required this.rawData,
    required this.id,
    required this.name,
    required this.names,
    required this.versionGroups,
    required this.descriptions,
  });

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    return MoveLearnMethod(
      rawData: json,
      id: json['id'],
      name: json['name'],
      names: (json['names'] as List<dynamic>).map((e) => Name.fromJson(e)).toList(),
      versionGroups: (json['version_groups'] as List<dynamic>).map((e) => NamedAPIResource.fromJson(e)).toList(),
      descriptions: (json['descriptions'] as List<dynamic>).map((e) => Description.fromJson(e)).toList(),
    );
  }
}

class PokemonMoveVersionResource extends NamedAPIResource<PokemonMoveVersion> {
  PokemonMoveVersionResource({
    required Map<String, dynamic> rawData,
    required String name,
    required String url,
  }) : super(
          rawData: rawData,
          name: name,
          url: url,
        );

  factory PokemonMoveVersionResource.fromJson(Map<String, dynamic> json) => PokemonMoveVersionResource(
        rawData: json,
        name: json['name'],
        url: json['url'],
      );

  @override
  PokemonMoveVersion mapper(dynamic data) => PokemonMoveVersion.fromJson(data);
}

class MoveLearnMethodResource extends NamedAPIResource<MoveLearnMethod> {
  MoveLearnMethodResource({
    required Map<String, dynamic> rawData,
    required String name,
    required String url,
  }) : super(
          rawData: rawData,
          name: name,
          url: url,
        );

  factory MoveLearnMethodResource.fromJson(Map<String, dynamic> json) => MoveLearnMethodResource(
        rawData: json,
        name: json['name'],
        url: json['url'],
      );

  @override
  MoveLearnMethod mapper(dynamic data) => MoveLearnMethod.fromJson(data);
}

class PastMoveStatValues with ResourceBase {
  final int? accuracy;
  final int? effectChance;
  final int? power;
  final int? pp;
  final int? effectEntries;
  final TypeResource? type;
  final VersionGroupResource? versionGroup;

  @override
  final Map<String, dynamic> rawData;

  PastMoveStatValues({
    required this.rawData,
    required this.accuracy,
    required this.effectChance,
    required this.power,
    required this.pp,
    required this.effectEntries,
    required this.type,
    required this.versionGroup,
  });

  factory PastMoveStatValues.fromJson(Map<String, dynamic> json) {
    return PastMoveStatValues(
      rawData: json,
      accuracy: json['accuracy'],
      effectChance: json['effect_chance'],
      power: json['power'],
      pp: json['pp'],
      effectEntries: json['effect_entries'],
      type: json['type'] != null ? TypeResource.fromJson(json['type']) : null,
      versionGroup: json['version_group'] != null ? VersionGroupResource.fromJson(json['version_group']) : null,
    );
  }
}
