import 'base.dart';

class PokemonSprites with ResourceBase {
  @override
  final Map<String, dynamic> rawData;

  /// The default depiction of this pokemon from the front in battle
  final String? frontDefault;

  /// The shiny depiction of this pokemon from the front in battle
  final String? frontShiny;

  /// The female depiction of this pokemon from the front in battle
  final String? frontFemale;

  /// The shiny female depiction of this pokemon from the front in battle
  final String? frontShinyFemale;

  /// The default depiction of this pokemon from the back in battle
  final String? backDefault;

  /// The shiny depiction of this pokemon from the back in battle
  final String? backShiny;

  /// The female depiction of this pokemon from the back in battle
  final String? backFemale;

  /// The shiny female depiction of this pokemon from the back in battle
  final String? backShinyFemale;

  PokemonSprites({
    required this.rawData,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontFemale,
    required this.frontShinyFemale,
    required this.backDefault,
    required this.backShiny,
    required this.backFemale,
    required this.backShinyFemale,
  });

  factory PokemonSprites.fromJson(Map<String, dynamic> json) => PokemonSprites(
        rawData: json,
        frontDefault: json['front_default'],
        frontShiny: json['front_shiny'],
        frontFemale: json['front_female'],
        frontShinyFemale: json['front_shiny_female'],
        backDefault: json['back_default'],
        backShiny: json['back_shiny'],
        backFemale: json['back_female'],
        backShinyFemale: json['back_shiny_female'],
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_female': frontFemale,
        'front_shiny_female': frontShinyFemale,
        'back_default': backDefault,
        'back_shiny': backShiny,
        'back_female': backFemale,
        'back_shiny_female': backShinyFemale,
      };
}

