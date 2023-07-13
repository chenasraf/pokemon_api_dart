import 'base.dart';
import 'name.dart';
import 'named_api_resource.dart';

class Language with ResourceBase {
  final String id;
  final String name;
  final bool official;
  final String iso639;
  final String iso3166;
  final List<Name> names;

  @override
  final Map<String, dynamic> rawData;

  Language({
    required this.rawData,
    required this.id,
    required this.name,
    required this.official,
    required this.iso639,
    required this.iso3166,
    required this.names,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      rawData: json,
      id: json['id'],
      name: json['name'],
      official: json['official'],
      iso639: json['iso639'],
      iso3166: json['iso3166'],
      names: json['names'].map((e) => Name.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'official': official,
      'iso639': iso639,
      'iso3166': iso3166,
      'names': names.map((e) => e.toJson()).toList(),
    };
  }
}

class LanguageResource extends NamedAPIResource<Language> {
  LanguageResource({
    required super.rawData,
    required super.name,
    required super.url,
  });

  factory LanguageResource.fromJson(Map<String, dynamic> json) {
    return LanguageResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  Language mapper(data) {
    return Language.fromJson(data);
  }
}

