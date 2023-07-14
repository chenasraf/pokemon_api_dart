import 'base.dart';
import 'description.dart';
import 'move.dart';
import 'name.dart';
import 'named_api_resource.dart';

class MoveDamageClass with ResourceBase {
  final int id;
  final String name;
  final List<Description> descriptions;
  final List<MoveResource> moves;
  final List<Name> names;

  @override
  Map<String, dynamic> rawData;

  MoveDamageClass({
    required this.rawData,
    required this.id,
    required this.name,
    required this.descriptions,
    required this.moves,
    required this.names,
  });

  factory MoveDamageClass.fromJson(Map<String, dynamic> json) {
    return MoveDamageClass(
      rawData: json,
      id: json['id'],
      name: json['name'],
      descriptions: json['descriptions'].map((e) => Description.fromJson(e)).toList(),
      moves: json['moves'].map((e) => MoveResource.fromJson(e)).toList(),
      names: json['names'].map((e) => Name.fromJson(e)).toList(),
    );
  }
}

class MoveDamageClassResource extends NamedAPIResource<MoveDamageClass> {
  MoveDamageClassResource({
    required super.rawData,
    required super.name,
    required super.url,
  });

  factory MoveDamageClassResource.fromJson(Map<String, dynamic> json) {
    return MoveDamageClassResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  MoveDamageClass mapper(data) {
    return MoveDamageClass.fromJson(data);
  }
}

