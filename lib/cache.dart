import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

abstract class CacheManager {
  Future<void> fill(Map<String, dynamic> cache);
  Future<void> clear();

  Future<void> add(String key, dynamic value);
  Future<void> remove(String key);

  Future<bool> contains(String key);
  Future<dynamic> get(String key);

  Future<T> tryGet<T>(
    String key, {
    T Function(dynamic data)? onResult,
  }) async {
    final mapper = onResult ?? ((data) => data);
    if (await contains(key)) {
      return mapper(await get(key));
    }
    final http = Dio();
    final response = await http.get(key);
    add(key, response.data);
    final value = mapper(response.data);
    return value;
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
  Future<void> add(String key, value) =>
      File('${basePath.path}/${_filename(key)}').writeAsString(jsonEncode(value));

  @override
  Future<void> clear() => basePath.delete(recursive: true);

  @override
  Future<bool> contains(String key) => File('${basePath.path}/${_filename(key)}').exists();

  @override
  Future<void> fill(Map<String, dynamic> cache) => Future.wait(cache.entries.map((e) => add(e.key, e.value)));

  @override
  Future<dynamic> get(String key) async =>
      jsonDecode(await File('${basePath.path}/${_filename(key)}').readAsString());

  @override
  Future<void> remove(String key) => File('${basePath.path}/${_filename(key)}').delete();
}

