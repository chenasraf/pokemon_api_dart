import 'base.dart';
import 'named_api_resource.dart';

class VersionGameIndex with ResourceBase {
  final int gameIndex;
  final NamedAPIResource version;
  @override
  final Map<String, dynamic> rawData;

  VersionGameIndex({
    required this.rawData,
    required this.gameIndex,
    required this.version,
  });

  factory VersionGameIndex.fromJson(Map<String, dynamic> json) {
    return VersionGameIndex(
      rawData: json,
      gameIndex: json['game_index'],
      version: NamedAPIResource.fromJson(json['version']),
    );
  }
}

