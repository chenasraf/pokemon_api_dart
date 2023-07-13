import 'base.dart';
import 'move_battle_style_preference.dart';
import 'name.dart';
import 'named_api_resource.dart';
import 'nature_stat_affect.dart';

class Nature with ResourceBase {
  final int id;
  final String name;
  final NamedAPIResource decreasedStat;
  final NamedAPIResource increasedStat;
  final NamedAPIResource hatesFlavor;
  final NamedAPIResource likesFlavor;
  final List<NatureStatChange> pokeathlonStatChanges;
  final List<MoveBattleStylePreference> moveBattleStylePreferences;
  final List<Name> names;

  @override
  Map<String, dynamic> rawData;

  Nature({
    required this.rawData,
    required this.id,
    required this.name,
    required this.decreasedStat,
    required this.increasedStat,
    required this.hatesFlavor,
    required this.likesFlavor,
    required this.pokeathlonStatChanges,
    required this.moveBattleStylePreferences,
    required this.names,
  });

  factory Nature.fromJson(Map<String, dynamic> json) {
    return Nature(
      rawData: json,
      id: json['id'],
      name: json['name'],
      decreasedStat: NamedAPIResource.fromJson(json['decreased_stat']),
      increasedStat: NamedAPIResource.fromJson(json['increased_stat']),
      hatesFlavor: NamedAPIResource.fromJson(json['hates_flavor']),
      likesFlavor: NamedAPIResource.fromJson(json['likes_flavor']),
      pokeathlonStatChanges: json['pokeathlon_stat_changes'].map((e) => NatureStatChange.fromJson(e)).toList(),
      moveBattleStylePreferences: json['move_battle_style_preferences'].map((e) => MoveBattleStylePreference.fromJson(e)).toList(),
      names: json['names'].map((e) => Name.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'decreased_stat': decreasedStat.toJson(),
      'increased_stat': increasedStat.toJson(),
      'hates_flavor': hatesFlavor.toJson(),
      'likes_flavor': likesFlavor.toJson(),
      'pokeathlon_stat_changes': pokeathlonStatChanges.map((e) => e.toJson()).toList(),
      'move_battle_style_preferences': moveBattleStylePreferences.map((e) => e.toJson()).toList(),
      'names': names.map((e) => e.toJson()).toList(),
    };
  }
}
