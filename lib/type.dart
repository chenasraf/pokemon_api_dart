import 'pokemon_api.dart';

class PokemonType with ResourceBase {
  final int slot;
  final TypeResource type;

  @override
  final Map<String, dynamic> rawData;

  PokemonType({
    required this.rawData,
    required this.slot,
    required this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      rawData: json,
      slot: json['slot'],
      type: TypeResource.fromJson(json['type']),
    );
  }
}

class Type with ResourceBase {
  final int id;
  final String name;
  final TypeRelations damageRelations;
  final List<TypeRelationsPast> pastDamageRelations;
  final List<GenerationGameIndex> gameIndices;
  final NamedAPIResource generation;
  final List<Name> names;
  final NamedAPIResource moveDamageClass;
  final List<MoveResource> moves;
  final List<TypePokemon> pokemon;

  @override
  final Map<String, dynamic> rawData;

  Type({
    required this.rawData,
    required this.id,
    required this.name,
    required this.damageRelations,
    required this.pastDamageRelations,
    required this.gameIndices,
    required this.generation,
    required this.names,
    required this.moveDamageClass,
    required this.moves,
    required this.pokemon,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      rawData: json,
      id: json['id'],
      name: json['name'],
      damageRelations: TypeRelations.fromJson(json['damage_relations']),
      pastDamageRelations:
          (json['past_damage_relations'] as List<dynamic>).map((e) => TypeRelationsPast.fromJson(e)).toList(),
      gameIndices: (json['game_indices'] as List<dynamic>).map((e) => GenerationGameIndex.fromJson(e)).toList(),
      generation: NamedAPIResource.fromJson(json['generation']),
      names: (json['names'] as List<dynamic>).map((e) => Name.fromJson(e)).toList(),
      moveDamageClass: NamedAPIResource.fromJson(json['move_damage_class']),
      moves: (json['moves'] as List<dynamic>).map((e) => MoveResource.fromJson(e)).toList(),
      pokemon: (json['pokemon'] as List<dynamic>).map((e) => TypePokemon.fromJson(e)).toList(),
    );
  }
}

class TypeRelations with ResourceBase {
  final List<NamedAPIResource> noDamageTo;
  final List<NamedAPIResource> halfDamageTo;
  final List<NamedAPIResource> doubleDamageTo;
  final List<NamedAPIResource> noDamageFrom;
  final List<NamedAPIResource> halfDamageFrom;
  final List<NamedAPIResource> doubleDamageFrom;

  @override
  final Map<String, dynamic> rawData;

  TypeRelations({
    required this.rawData,
    required this.noDamageTo,
    required this.halfDamageTo,
    required this.doubleDamageTo,
    required this.noDamageFrom,
    required this.halfDamageFrom,
    required this.doubleDamageFrom,
  });

  factory TypeRelations.fromJson(Map<String, dynamic> json) {
    return TypeRelations(
      rawData: json,
      noDamageTo: (json['no_damage_to'] as List<dynamic>).map((e) => NamedAPIResource.fromJson(e)).toList(),
      halfDamageTo: (json['half_damage_to'] as List<dynamic>).map((e) => NamedAPIResource.fromJson(e)).toList(),
      doubleDamageTo: (json['double_damage_to'] as List<dynamic>).map((e) => NamedAPIResource.fromJson(e)).toList(),
      noDamageFrom: (json['no_damage_from'] as List<dynamic>).map((e) => NamedAPIResource.fromJson(e)).toList(),
      halfDamageFrom: (json['half_damage_from'] as List<dynamic>).map((e) => NamedAPIResource.fromJson(e)).toList(),
      doubleDamageFrom: (json['double_damage_from'] as List<dynamic>).map((e) => NamedAPIResource.fromJson(e)).toList(),
    );
  }
}

class TypeRelationsPast with ResourceBase {
  final NamedAPIResource generation;
  final TypeRelations damageRelations;

  @override
  final Map<String, dynamic> rawData;

  TypeRelationsPast({
    required this.rawData,
    required this.generation,
    required this.damageRelations,
  });

  factory TypeRelationsPast.fromJson(Map<String, dynamic> json) {
    return TypeRelationsPast(
      rawData: json,
      generation: NamedAPIResource.fromJson(json['generation']),
      damageRelations: TypeRelations.fromJson(json['damage_relations']),
    );
  }
}

class TypePokemon with ResourceBase {
  final int slot;
  final PokemonResource pokemon;

  @override
  final Map<String, dynamic> rawData;

  TypePokemon({
    required this.rawData,
    required this.slot,
    required this.pokemon,
  });

  factory TypePokemon.fromJson(Map<String, dynamic> json) {
    return TypePokemon(
      rawData: json,
      slot: json['slot'],
      pokemon: PokemonResource.fromJson(json['pokemon']),
    );
  }
}

class TypeResource extends NamedAPIResource<Type> {
  TypeResource({required super.url, required super.name, required super.rawData});

  factory TypeResource.fromJson(Map<String, dynamic> json) {
    return TypeResource(
      url: json['url'],
      name: json['name'],
      rawData: json,
    );
  }

  @override
  Type mapper(data) {
    return Type.fromJson(data);
  }
}

