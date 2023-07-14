import 'base.dart';
import 'named_api_resource.dart';

class FlavorText with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final String flavorText;
  final NamedAPIResource language;
  final NamedAPIResource version;

  FlavorText({
    required this.rawData,
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorText.fromJson(Map<String, dynamic> json) {
    return FlavorText(
      rawData: json,
      flavorText: json['flavor_text'],
      language: NamedAPIResource.fromJson(json['language']),
      version: NamedAPIResource.fromJson(json['version']),
    );
  }
}

class MoveFlavorText with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final String flavorText;
  final NamedAPIResource language;
  final NamedAPIResource versionGroup;

  MoveFlavorText({
    required this.rawData,
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });

  factory MoveFlavorText.fromJson(Map<String, dynamic> json) {
    return MoveFlavorText(
      rawData: json,
      flavorText: json['flavor_text'],
      language: NamedAPIResource.fromJson(json['language']),
      versionGroup: NamedAPIResource.fromJson(json['version_group']),
    );
  }
}
