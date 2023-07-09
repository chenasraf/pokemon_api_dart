import 'pokemon_api.dart';

class NamedAPIResource<T> with ResourceBase {
  @override
  final Map<String, dynamic> rawData;
  final String name;
  final String url;

  NamedAPIResource({
    required this.rawData,
    required String? name,
    required this.url,
  }) : name = name ?? 'UNNAMED RESOURCE';

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) {
    try {
      return NamedAPIResource(
        rawData: json,
        name: json['name'],
        url: json['url'],
      );
    } catch (e, stack) {
      print('Error parsing NamedAPIResource: $e, json: $json');
      print(stack);
      rethrow;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
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

