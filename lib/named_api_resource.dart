import 'pokemon_api.dart';

class APIResource<T> with ResourceBase {
  @override
  final Map<String, dynamic> rawData;
  final String url;

  APIResource({
    required this.rawData,
    required this.url,
  });

  factory APIResource.fromJson(Map<String, dynamic> json) {
    return APIResource(
      rawData: json,
      url: json['url'],
    );
  }

  T mapper(dynamic data) {
    return data as T;
  }

  Future<T> get() async {
    if (url.isEmpty) {
      throw Exception('URL is empty');
    }
    final api = PokemonAPIClient.instance;
    return api.cache.getOne(url, onResult: mapper);
  }
}

class NamedAPIResource<T> extends APIResource<T> {
  final String name;

  NamedAPIResource({
    required super.rawData,
    required this.name,
    required super.url,
  });

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) {
    return NamedAPIResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }
}

