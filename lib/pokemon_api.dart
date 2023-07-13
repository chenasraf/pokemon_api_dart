library pokemon_api;

import 'dart:async';

import 'package:dio/dio.dart';

import 'cache.dart';
import 'pokemon.dart';
import 'pokemon_species.dart';

export 'ability.dart';
export 'base.dart';
export 'cache.dart';
export 'description.dart';
export 'encounter.dart';
export 'flavor_text.dart';
export 'generation.dart';
export 'generation_game_index.dart';
export 'genus.dart';
export 'held_item.dart';
export 'location.dart';
export 'location_area.dart';
export 'move.dart';
export 'name.dart';
export 'named_api_resource.dart';
export 'pal_park_encounter_area.dart';
export 'past_type.dart';
export 'pokedex.dart';
export 'pokedex_number.dart';
export 'pokemon.dart';
export 'pokemon_api.dart';
export 'pokemon_entry.dart';
export 'pokemon_species.dart';
export 'pokemon_species_variety.dart';
export 'region.dart';
export 'sprites.dart';
export 'stat.dart';
export 'type.dart';
export 'version_game_index.dart';

/// The main API client to fetch Pokemon data.
/// See [https://pokeapi.co/] for more information.
class PokemonAPIClient {
  static const String baseUrl = 'https://pokeapi.co/api/v2';
  static final http = Dio();
  CacheManager _cache;

  PokemonAPIClient({CacheManager? cache})
      : _cache = cache ?? MemoryCache(); // ?? FilesystemCache(baseDirectory: '${Directory.current.path}/.cache');

  CacheManager get cache => _cache;
  setCache(CacheManager cache) => _cache = cache;
  Future<void> loadCache(Map<String, dynamic> cache) async => _cache.fill(cache);
  Future<void> clearCache() async => _cache.clear();

  static PokemonAPIClient instance = PokemonAPIClient();
  static void setInstance(PokemonAPIClient client) => instance = client;

  /// Get a list of Pokemon
  Future<List<PokemonResource>> getPokemonList(
    PageOptions pageOptions, {
    int? maxPages,
  }) async =>
      cache.getPages(
        '$baseUrl/pokemon',
        pageOptions,
        onResult: (data) => PokemonResource.fromJson(data),
        maxPages: maxPages,
      );

  /// Get a list of Pokemon Species
  Future<List<PokemonSpeciesResource>> getPokemonSpeciesList(
    PageOptions pageOptions, {
    int? maxPages,
  }) async =>
      cache.getPages(
        '$baseUrl/pokemon-species',
        pageOptions,
        onResult: (data) => PokemonSpeciesResource.fromJson(data),
        maxPages: maxPages,
      );

  /// Get a single Pokemon by name or id
  Future<Pokemon> getPokemon(String nameOrId) async => cache.getOne(
        '$baseUrl/pokemon/$nameOrId',
        onResult: (data) => Pokemon.fromJson(data),
      );

  /// Get a single Pokemon Species by name or id
  Future<PokemonSpecies> getPokemonSpecies(String nameOrId) async => cache.getOne(
        '$baseUrl/pokemon-species/$nameOrId',
        onResult: (data) => PokemonSpecies.fromJson(data),
      );
}

class Pagination<T> {
  final List<T> results;
  final String? next;
  final String? previous;
  final int count;

  Pagination({
    required this.results,
    this.next,
    this.previous,
    required this.count,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        results: json['results'],
        next: json['next'],
        previous: json['previous'],
        count: json['count'],
      );
}

class PageOptions {
  final int limit;
  final int offset;

  PageOptions({
    this.limit = 100,
    this.offset = 0,
  });

  Map<String, dynamic> toJson() => {
        'limit': limit,
        'offset': offset,
      };

  @override
  String toString() => Uri(queryParameters: {
        'limit': [limit.toString()],
        'offset': [offset.toString()],
      }).query;
}

