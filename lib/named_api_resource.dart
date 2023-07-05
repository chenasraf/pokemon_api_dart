import 'package:dio/dio.dart';

import 'pokemon_api.dart';

class NamedAPIResource<T> with ResourceBase {
  @override
  final Map<String, dynamic> rawData;
  final String name;
  final String url;

  NamedAPIResource({
    required this.rawData,
    required this.name,
    required this.url,
  });

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) {
    return NamedAPIResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
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
    if (await api.cache.contains(url)) {
      return mapper(await api.cache.get(url));
    }
    try {
      final http = Dio();
      final result = await http.get(url);
      api.cache.add(url, result.data);
      final value = mapper(result.data);
      return value;
    } catch (e) {
      print('Error in NamedAPIResource.get for url $url');
      print(e);
      rethrow;
    }
  }
}

