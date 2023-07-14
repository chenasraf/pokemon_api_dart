import 'base.dart';
import 'characteristic.dart';
import 'move_damage_class.dart';
import 'move_stat_affect.dart';
import 'name.dart';
import 'named_api_resource.dart';
import 'nature_stat_affect.dart';

class PokemonStat with ResourceBase {
  final int baseStat;
  final int effort;
  final NamedAPIResource stat;

  @override
  Map<String, dynamic> rawData;

  PokemonStat({
    required this.rawData,
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    return PokemonStat(
      rawData: json,
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: NamedAPIResource.fromJson(json['stat']),
    );
  }
}

class Stat with ResourceBase {
  final int id;
  final String name;
  final int gameIndex;
  final bool isBattleOnly;
  final MoveDamageClassResource moveDamageClass;
  final List<Name> names;
  final MoveStatAffectSets affectingMoves;
  final NatureStatAffectSets affectingNatures;
  final List<Characteristic> characteristics;

  @override
  Map<String, dynamic> rawData;

  Stat({
    required this.rawData,
    required this.id,
    required this.name,
    required this.gameIndex,
    required this.isBattleOnly,
    required this.moveDamageClass,
    required this.names,
    required this.affectingMoves,
    required this.affectingNatures,
    required this.characteristics,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      rawData: json,
      id: json['id'],
      name: json['name'],
      gameIndex: json['game_index'],
      isBattleOnly: json['is_battle_only'],
      moveDamageClass: MoveDamageClassResource.fromJson(json['move_damage_class']),
      names: json['names'].map((e) => Name.fromJson(e)).toList(),
      affectingMoves: MoveStatAffectSets.fromJson(json['affecting_moves']),
      affectingNatures: NatureStatAffectSets.fromJson(json['affecting_natures']),
      characteristics: json['characteristics'].map((e) => Characteristic.fromJson(e)).toList(),
    );
  }
}

