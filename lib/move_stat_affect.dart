
import 'base.dart';
import 'move.dart';

class MoveStatAffectSets with ResourceBase {
  final List<MoveStatAffect> increase;
  final List<MoveStatAffect> decrease;

  @override
  Map<String, dynamic> rawData;

  MoveStatAffectSets({
    required this.rawData,
    required this.increase,
    required this.decrease,
  });

  factory MoveStatAffectSets.fromJson(Map<String, dynamic> json) {
    return MoveStatAffectSets(
      rawData: json,
      increase: json['increase'].map((e) => MoveStatAffect.fromJson(e)).toList(),
      decrease: json['decrease'].map((e) => MoveStatAffect.fromJson(e)).toList(),
    );
  }
}

class MoveStatAffect with ResourceBase {
  final int change;
  final MoveResource move;

  @override
  Map<String, dynamic> rawData;

  MoveStatAffect({
    required this.rawData,
    required this.change,
    required this.move,
  });

  factory MoveStatAffect.fromJson(Map<String, dynamic> json) {
    return MoveStatAffect(
      rawData: json,
      change: json['change'],
      move: MoveResource.fromJson(json['move']),
    );
  }
}
