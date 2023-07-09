import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import 'pokemon_api.dart';

abstract class CacheManager {
  Future<void> fill(Map<String, dynamic> cache);
  Future<void> clear();

  Future<void> add(String key, dynamic value);
  Future<void> remove(String key);

  Future<bool> contains(String key);
  Future<dynamic> get(String key);

  Future<T> getOne<T>(
    String key, {
    T Function(dynamic data)? onResult,
    int? retry,
  }) async {
    final _retry = retry ?? 3;
    Response? response;
    try {
      final mapper = onResult ?? ((data) => data);
      if (await contains(key)) {
        return mapper(await get(key));
      }
      final http = Dio();
      response = await http.get(key);
      final value = mapper(response.data);
      add(key, response.data);
      return value;
    } catch (e, stack) {
      if (_retry > 0) {
        return getOne(key, onResult: onResult, retry: _retry - 1);
      }
      remove(key);
      print('Error getting $key: $e.\nResponse: $response');
      print(stack);
      rethrow;
    }
  }

  Future<Pagination<T>> _getPage<T>(
    String url,
    PageOptions pageOptions, {
    T Function(dynamic data)? onResult,
  }) async {
    final mapper = onResult ?? ((data) => data);
    final curKey = '$url?$pageOptions';
    try {
      if (await contains(curKey)) {
        final response = await get(curKey);
        final data = Pagination<T>.fromJson({
          ...response,
          'results': (response['results'] as List).map(mapper).toList(),
        });
        return data;
      }
      final http = Dio();
      final response = await http.get(curKey);
      if (response.data == null) {
        throw Exception('No data');
      }
      final data = Pagination<T>.fromJson({
        ...response.data,
        'results': (response.data['results'] as List).map(mapper).toList(),
      });
      add(curKey, response.data);
      return data;
    } catch (e) {
      remove(curKey);
      throw Exception('Error getting $url: $e');
    }
  }

  Future<List<T>> getPages<T>(
    String url,
    PageOptions pageOptions, {
    T Function(dynamic data)? onResult,
    int? maxPages,
  }) async {
    final mapper = onResult ?? ((data) => data);
    var data = await _getPage<T>(url, pageOptions, onResult: mapper);
    final pages = [data];

    while (data.next != null && (maxPages == null || pages.length < maxPages)) {
      data = await _getPage<T>(data.next!, pageOptions, onResult: mapper);
      pages.add(data);
    }
    return pages.expand((e) => e.results).toList();
  }
}

class MemoryCache extends CacheManager {
  final Map<String, dynamic> _cache = {};

  @override
  Future<void> add(String key, value) async => _cache[key] = value;

  @override
  Future<void> clear() async => _cache.clear();

  @override
  Future<bool> contains(String key) async => _cache.containsKey(key);

  @override
  Future<void> fill(Map<String, dynamic> cache) async => _cache.addAll(cache);

  @override
  Future<dynamic> get(String key) async => _cache[key];

  @override
  Future<void> remove(String key) async => _cache.remove(key);
}

class FilesystemCache extends CacheManager {
  final Directory basePath;

  String _filename(String key) => '${md5.convert(utf8.encode(key))}.json';

  FilesystemCache({String? baseDirectory})
      : basePath =
            baseDirectory != null ? Directory(baseDirectory) : Directory.systemTemp.createTempSync('pokemon_cache') {
    if (!basePath.existsSync()) {
      basePath.createSync(recursive: true);
    }
  }

  @override
  Future<void> add(String key, value) => File('${basePath.path}/${_filename(key)}').writeAsString(jsonEncode(value));

  @override
  Future<void> clear() => basePath.delete(recursive: true);

  @override
  Future<bool> contains(String key) => File('${basePath.path}/${_filename(key)}').exists();

  @override
  Future<void> fill(Map<String, dynamic> cache) => Future.wait(cache.entries.map((e) => add(e.key, e.value)));

  @override
  Future<dynamic> get(String key) async => jsonDecode(await File('${basePath.path}/${_filename(key)}').readAsString());

  @override
  Future<void> remove(String key) => File('${basePath.path}/${_filename(key)}').delete();
}

