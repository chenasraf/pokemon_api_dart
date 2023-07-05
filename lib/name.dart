import 'base.dart';
import 'named_api_resource.dart';

class Name with ResourceBase {
  final String name;
  final NamedAPIResource language;
  @override
  final Map<String, dynamic> rawData;

  Name({
    required this.rawData,
    required this.name,
    required this.language,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      rawData: json,
      name: json['name'],
      language: NamedAPIResource.fromJson(json['language']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'language': language.toJson(),
    };
  }
}

