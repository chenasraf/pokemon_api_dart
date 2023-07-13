import 'base.dart';
import 'generation.dart';
import 'language.dart';
import 'name.dart';
import 'named_api_resource.dart';
import 'pokemon.dart';

class PokemonAbility with ResourceBase {
  final bool isHidden;
  final int slot;
  final AbilityResource ability;

  @override
  final Map<String, dynamic> rawData;

  PokemonAbility({
    required this.rawData,
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) {
    return PokemonAbility(
      rawData: json,
      isHidden: json['is_hidden'],
      slot: json['slot'],
      ability: AbilityResource.fromJson(json['ability']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'is_hidden': isHidden,
      'slot': slot,
      'ability': ability.toJson(),
    };
  }
}

class Ability with ResourceBase {
  final int id;
  final String name;
  final bool isMainSeries;
  final GenerationResource generation;
  final List<Name> names;
  final List<VerboseEffect> effectEntries;
  final List<AbilityEffectChange> effectChanges;
  final List<AbilityFlavorText> flavorTextEntries;
  final List<AbilityPokemon> pokemon;

  @override
  final Map<String, dynamic> rawData;

  Ability({
    required this.rawData,
    required this.id,
    required this.name,
    required this.isMainSeries,
    required this.generation,
    required this.names,
    required this.effectEntries,
    required this.effectChanges,
    required this.flavorTextEntries,
    required this.pokemon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      rawData: json,
      id: json['id'],
      name: json['name'],
      isMainSeries: json['is_main_series'],
      generation: GenerationResource.fromJson(json['generation']),
      names: json['names'].map<Name>((e) => Name.fromJson(e)).toList(),
      effectEntries: json['effect_entries'].map<VerboseEffect>((e) => VerboseEffect.fromJson(e)).toList(),
      effectChanges: json['effect_changes'].map<AbilityEffectChange>((e) => AbilityEffectChange.fromJson(e)).toList(),
      flavorTextEntries:
          json['flavor_text_entries'].map<AbilityFlavorText>((e) => AbilityFlavorText.fromJson(e)).toList(),
      pokemon: json['pokemon'].map<AbilityPokemon>((e) => AbilityPokemon.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'is_main_series': isMainSeries,
      'generation': generation.toJson(),
      'names': names.map((e) => e.toJson()).toList(),
      'effect_entries': effectEntries.map((e) => e.toJson()).toList(),
      'effect_changes': effectChanges.map((e) => e.toJson()).toList(),
      'flavor_text_entries': flavorTextEntries.map((e) => e.toJson()).toList(),
      'pokemon': pokemon.map((e) => e.toJson()).toList(),
    };
  }
}

class AbilityPokemon with ResourceBase {
  final bool isHidden;
  final int slot;
  final PokemonResource pokemon;

  @override
  final Map<String, dynamic> rawData;

  AbilityPokemon({
    required this.rawData,
    required this.isHidden,
    required this.slot,
    required this.pokemon,
  });

  factory AbilityPokemon.fromJson(Map<String, dynamic> json) {
    return AbilityPokemon(
      rawData: json,
      isHidden: json['is_hidden'],
      slot: json['slot'],
      pokemon: PokemonResource.fromJson(json['pokemon']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'is_hidden': isHidden,
      'slot': slot,
      'pokemon': pokemon.toJson(),
    };
  }
}

class AbilityFlavorText with ResourceBase {
  final String flavorText;
  final LanguageResource language;
  final NamedAPIResource versionGroup;

  @override
  final Map<String, dynamic> rawData;

  AbilityFlavorText({
    required this.rawData,
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });

  factory AbilityFlavorText.fromJson(Map<String, dynamic> json) {
    return AbilityFlavorText(
      rawData: json,
      flavorText: json['flavor_text'],
      language: LanguageResource.fromJson(json['language']),
      versionGroup: NamedAPIResource.fromJson(json['version_group']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'flavor_text': flavorText,
      'language': language.toJson(),
      'version_group': versionGroup.toJson(),
    };
  }
}

class AbilityEffectChange with ResourceBase {
  final List<VerboseEffect> effectEntries;
  final NamedAPIResource versionGroup;
  @override
  final Map<String, dynamic> rawData;

  AbilityEffectChange({
    required this.rawData,
    required this.effectEntries,
    required this.versionGroup,
  });

  factory AbilityEffectChange.fromJson(Map<String, dynamic> json) {
    return AbilityEffectChange(
      rawData: json,
      effectEntries: json['effect_entries'].map<VerboseEffect>((e) => VerboseEffect.fromJson(e)).toList(),
      versionGroup: NamedAPIResource.fromJson(json['version_group']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'effect_entries': effectEntries.map((e) => e.toJson()).toList(),
      'version_group': versionGroup.toJson(),
    };
  }
}

class VerboseEffect with ResourceBase {
  final String effect;
  final String? shortEffect;
  final NamedAPIResource language;

  @override
  final Map<String, dynamic> rawData;

  VerboseEffect({
    required this.rawData,
    required this.effect,
    required this.shortEffect,
    required this.language,
  });

  factory VerboseEffect.fromJson(Map<String, dynamic> json) {
    return VerboseEffect(
      rawData: json,
      effect: json['effect'],
      shortEffect: json['short_effect'],
      language: NamedAPIResource.fromJson(json['language']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'effect': effect,
      'short_effect': shortEffect,
      'language': language.toJson(),
    };
  }
}

class AbilityResource extends NamedAPIResource<Ability> {
  AbilityResource({
    required super.name,
    required super.url,
    required super.rawData,
  });

  factory AbilityResource.fromJson(Map<String, dynamic> json) {
    return AbilityResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  @override
  Ability mapper(dynamic data) {
    return Ability.fromJson(data);
  }
}

