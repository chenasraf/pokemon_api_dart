import 'base.dart';
import 'named_api_resource.dart';

class PokemonMove with ResourceBase {
  final NamedAPIResource move;
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
      move: NamedAPIResource.fromJson(json['move']),
      versionGroupDetails:
          (json['version_group_details'] as List<dynamic>).map((e) => PokemonMoveVersion.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'move': move.toJson(),
      'version_group_details': versionGroupDetails.map((e) => e.toJson()).toList(),
    };
  }
}

class PokemonMoveVersion with ResourceBase {
  final NamedAPIResource versionGroup;
  final int levelLearnedAt;
  final NamedAPIResource moveLearnMethod;
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
      versionGroup: NamedAPIResource.fromJson(json['version_group']),
      levelLearnedAt: json['level_learned_at'],
      moveLearnMethod: NamedAPIResource.fromJson(json['move_learn_method']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'version_group': versionGroup.toJson(),
      'level_learned_at': levelLearnedAt,
      'move_learn_method': moveLearnMethod.toJson(),
    };
  }
}

