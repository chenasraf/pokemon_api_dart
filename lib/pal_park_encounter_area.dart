import 'base.dart';
import 'named_api_resource.dart';

class PalParkEncounterArea with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final int baseScore;
  final int rate;
  final NamedAPIResource area;

  PalParkEncounterArea({
    required this.rawData,
    required this.baseScore,
    required this.rate,
    required this.area,
  });

  factory PalParkEncounterArea.fromJson(Map<String, dynamic> json) {
    return PalParkEncounterArea(
      rawData: json,
      baseScore: json['base_score'],
      rate: json['rate'],
      area: NamedAPIResource.fromJson(json['area']),
    );
  }
}

