import 'base.dart';
import 'description.dart';
import 'named_api_resource.dart';

class Characteristic with ResourceBase {
  final int id;
  final int geneModulo;
  final List<int> possibleValues;
  final List<Description> descriptions;
  final NamedAPIResource highestStat;

  @override
  Map<String, dynamic> rawData;

  Characteristic({
    required this.rawData,
    required this.id,
    required this.geneModulo,
    required this.possibleValues,
    required this.descriptions,
    required this.highestStat,
  });

  factory Characteristic.fromJson(Map<String, dynamic> json) {
    return Characteristic(
      rawData: json,
      id: json['id'],
      geneModulo: json['gene_modulo'],
      possibleValues: json['possible_values'].cast<int>(),
      descriptions: json['descriptions'].map<Description>((e) => Description.fromJson(e)).toList(),
      highestStat: NamedAPIResource.fromJson(json['highest_stat']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gene_modulo': geneModulo,
      'possible_values': possibleValues,
      'descriptions': descriptions.map((e) => e.toJson()).toList(),
      'highest_stat': highestStat.toJson(),
    };
  }
}
