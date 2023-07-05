import 'base.dart';
import 'named_api_resource.dart';

class Description with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final String description;
  final NamedAPIResource language;

  Description({
    required this.rawData,
    required this.description,
    required this.language,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      rawData: json,
      description: json['description'],
      language: NamedAPIResource.fromJson(json['language']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'description': description,
        'language': language.toJson(),
      };
}

