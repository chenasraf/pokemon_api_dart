import 'base.dart';
import 'named_api_resource.dart';

class Genus with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final String genus;
  final NamedAPIResource language;

  Genus({
    required this.rawData,
    required this.genus,
    required this.language,
  });

  factory Genus.fromJson(Map<String, dynamic> json) {
    return Genus(
      rawData: json,
      genus: json['genus'],
      language: NamedAPIResource.fromJson(json['language']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'genus': genus,
        'language': language.toJson(),
      };
}

