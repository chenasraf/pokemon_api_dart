import 'base.dart';
import 'named_api_resource.dart';

class GenerationGameIndex with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  /// The internal id of an API resource within game data
  final int gameIndex;

  /// The generation relevent to this game index
  final NamedAPIResource generation;

  GenerationGameIndex({
    required this.rawData,
    required this.gameIndex,
    required this.generation,
  });

  factory GenerationGameIndex.fromJson(Map<String, dynamic> json) => GenerationGameIndex(
        rawData: json,
        gameIndex: json['game_index'],
        generation: NamedAPIResource.fromJson(json['generation']),
      );

  Map<String, dynamic> toJson() => {
        'game_index': gameIndex,
        'generation': generation.toJson(),
      };

  @override
  String toString() {
    return 'GenerationGameIndex{gameIndex: $gameIndex, generation: $generation}';
  }
}
