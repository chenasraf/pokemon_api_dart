library pokemon_api;

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'cache.dart';
import 'pokemon.dart';

export "ability.dart";
export "base.dart";
export "cache.dart";
export "encounter.dart";
export "generation.dart";
export "generation_game_index.dart";
export "held_item.dart";
export "location.dart";
export "location_area.dart";
export "move.dart";
export "name.dart";
export "named_api_resource.dart";
export "past_type.dart";
export "pokemon.dart";
export "pokemon_api.dart";
export "region.dart";
export "sprites.dart";
export "version_game_index.dart";

/// The main API client to fetch Pokemon data.
/// See [https://pokeapi.co/] for more information.
class PokemonAPIClient {
  static const String baseUrl = 'https://pokeapi.co/api/v2';
  static final http = Dio();
  CacheManager _cache;

  PokemonAPIClient({CacheManager? cache})
      : _cache = cache ?? FilesystemCache(baseDirectory: '${Directory.current.path}/.cache');

  CacheManager get cache => _cache;
  setCache(CacheManager cache) => _cache = cache;
  Future<void> loadCache(Map<String, dynamic> cache) async => _cache.fill(cache);
  Future<void> clearCache() async => _cache.clear();

  static PokemonAPIClient instance = PokemonAPIClient();
  static void setInstance(PokemonAPIClient client) => instance = client;

  /// Get a list of Pokemon
  Future<List<PokemonResource>> getPokemonList([int limit = 10]) async => cache.tryGet(
        '$baseUrl/pokemon?limit=$limit',
        onMiss: (data) => (data['results'] as List<dynamic>).map((e) => PokemonResource.fromJson(e)).toList(),
      );

  /// Get a single Pokemon by name or id
  Future<Pokemon> getPokemonByNameOrId(String nameOrId) async => cache.tryGet(
        '$baseUrl/pokemon/$nameOrId',
        onMiss: (data) => Pokemon.fromJson(data),
      );
}

