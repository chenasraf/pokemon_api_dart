import 'base.dart';
import 'named_api_resource.dart';

class PokedexNumber with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  final int entryNumber;
  final NamedAPIResource pokedex;

  PokedexNumber({
    required this.rawData,
    required this.entryNumber,
    required this.pokedex,
  });

  factory PokedexNumber.fromJson(Map<String, dynamic> json) {
    return PokedexNumber(
      rawData: json,
      entryNumber: json['entry_number'],
      pokedex: NamedAPIResource.fromJson(json['pokedex']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'entry_number': entryNumber,
        'pokedex': pokedex.toJson(),
      };
}

