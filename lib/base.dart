import 'named_api_resource.dart';

mixin ResourceBase {
  /// The raw JSON data from the API
  Map<String, dynamic> get rawData;

  /// Gets a resource from a NamedAPIResource
  Future<T> getNamedResource<T>(NamedAPIResource resource, [T Function(dynamic value)? mapper]) async {
    final mapFn = mapper ?? (dynamic value) => value as T;
    return mapFn(await resource.get());
  }

  @override
  String toString() {
    return '$runtimeType{${toJson()}}';
  }

  Map<String, dynamic> toJson();
}

