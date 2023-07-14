import 'base.dart';
import 'name.dart';
import 'named_api_resource.dart';

class MoveBattleStylePreference with ResourceBase {
  final int lowHpPreference;
  final int highHpPreference;
  final NamedAPIResource moveBattleStyle;

  @override
  Map<String, dynamic> rawData;

  MoveBattleStylePreference({
    required this.rawData,
    required this.lowHpPreference,
    required this.highHpPreference,
    required this.moveBattleStyle,
  });

  factory MoveBattleStylePreference.fromJson(Map<String, dynamic> json) {
    return MoveBattleStylePreference(
      rawData: json,
      lowHpPreference: json['low_hp_preference'],
      highHpPreference: json['high_hp_preference'],
      moveBattleStyle: NamedAPIResource.fromJson(json['move_battle_style']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'low_hp_preference': lowHpPreference,
      'high_hp_preference': highHpPreference,
      'move_battle_style': moveBattleStyle.toJson(),
    };
  }
}

class MoveBattleStyle with ResourceBase {
  final int id;
  final String name;
  final List<Name> names;

  @override
  Map<String, dynamic> rawData;

  MoveBattleStyle({
    required this.rawData,
    required this.id,
    required this.name,
    required this.names,
  });

  factory MoveBattleStyle.fromJson(Map<String, dynamic> json) {
    return MoveBattleStyle(
      rawData: json,
      id: json['id'],
      name: json['name'],
      names: json['names'].map((e) => Name.fromJson(e)).toList(),
    );
  }
}

