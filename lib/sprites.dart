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

  /// The default depiction of this pokemon from the front in battle (transparent background)
  final String? frontTransparent;

  /// The default depiction of this pokemon from the back in battle (transparent background)
  final String? backTransparent;

  /// The default depiction of this pokemon from the front in battle (grayscale)
  final String? frontGray;

  /// The default depiction of this pokemon from the back in battle (grayscale)
  final String? backGray;

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
    required this.frontTransparent,
    required this.backTransparent,
    required this.frontGray,
    required this.backGray,
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
        frontTransparent: json['front_transparent'],
        backTransparent: json['back_transparent'],
        frontGray: json['front_gray'],
        backGray: json['back_gray'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_female': frontFemale,
        'front_shiny_female': frontShinyFemale,
        'back_default': backDefault,
        'back_shiny': backShiny,
        'back_female': backFemale,
        'back_shiny_female': backShinyFemale,
        'front_transparent': frontTransparent,
        'back_transparent': backTransparent,
        'front_gray': frontGray,
        'back_gray': backGray,
      };
}

class PokemonAllSprites extends PokemonSprites {
  PokemonAllSprites({
    required super.rawData,
    required super.frontDefault,
    required super.frontShiny,
    required super.frontFemale,
    required super.frontShinyFemale,
    required super.backDefault,
    required super.backShiny,
    required super.backFemale,
    required super.backShinyFemale,
    required super.frontTransparent,
    required super.backTransparent,
    required super.frontGray,
    required super.backGray,
    required this.other,
    required this.versions,
  });

  /// Additional sprites of this pokemon
  final PokemonSpritesOther? other;

  /// Sprites for this pokemon on different game versions
  final PokemonSpritesVersions? versions;

  factory PokemonAllSprites.fromJson(Map<String, dynamic> json) => PokemonAllSprites(
        rawData: json,
        frontDefault: json['front_default'],
        frontShiny: json['front_shiny'],
        frontFemale: json['front_female'],
        frontShinyFemale: json['front_shiny_female'],
        backDefault: json['back_default'],
        backShiny: json['back_shiny'],
        backFemale: json['back_female'],
        backShinyFemale: json['back_shiny_female'],
        frontTransparent: json['front_transparent'],
        backTransparent: json['back_transparent'],
        frontGray: json['front_gray'],
        backGray: json['back_gray'],
        other: json['other'] != null ? PokemonSpritesOther.fromJson(json['other']) : null,
        versions: json['versions'] != null ? PokemonSpritesVersions.fromJson(json['versions']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_female': frontFemale,
        'front_shiny_female': frontShinyFemale,
        'back_default': backDefault,
        'back_shiny': backShiny,
        'back_female': backFemale,
        'back_shiny_female': backShinyFemale,
        'front_transparent': frontTransparent,
        'back_transparent': backTransparent,
        'front_gray': frontGray,
        'back_gray': backGray,
        'other': other?.toJson(),
        'versions': versions?.toJson(),
      };
}

class PokemonSpritesOther {
  final PokemonSprites? dreamWorld;
  final PokemonSprites? officialArtwork;
  final PokemonSprites? home;

  PokemonSpritesOther({
    required this.dreamWorld,
    required this.officialArtwork,
    required this.home,
  });

  factory PokemonSpritesOther.fromJson(Map<String, dynamic> json) => PokemonSpritesOther(
        dreamWorld: json['dream_world'] != null ? PokemonSprites.fromJson(json['dream_world']) : null,
        officialArtwork: json['official-artwork'] != null ? PokemonSprites.fromJson(json['official-artwork']) : null,
        home: json['home'] != null ? PokemonSprites.fromJson(json['home']) : null,
      );

  Map<String, dynamic> toJson() => {
        'dream_world': dreamWorld?.toJson(),
        'official-artwork': officialArtwork?.toJson(),
        'home': home?.toJson(),
      };
}

class PokemonSpritesVersions {
  final PokemonSpritesGeneration1? generation1;
  final PokemonSpritesGeneration2? generation2;
  final PokemonSpritesGeneration3? generation3;
  final PokemonSpritesGeneration4? generation4;
  final PokemonSpritesGeneration5? generation5;
  final PokemonSpritesGeneration6? generation6;
  final PokemonSpritesGeneration7? generation7;
  final PokemonSpritesGeneration8? generation8;

  PokemonSpritesVersions({
    required this.generation1,
    required this.generation2,
    required this.generation3,
    required this.generation4,
    required this.generation5,
    required this.generation6,
    required this.generation7,
    required this.generation8,
  });

  factory PokemonSpritesVersions.fromJson(Map<String, dynamic> json) => PokemonSpritesVersions(
        generation1: json['generation-i'] != null ? PokemonSpritesGeneration1.fromJson(json['generation-i']) : null,
        generation2: json['generation-ii'] != null ? PokemonSpritesGeneration2.fromJson(json['generation-ii']) : null,
        generation3: json['generation-iii'] != null ? PokemonSpritesGeneration3.fromJson(json['generation-iii']) : null,
        generation4: json['generation-iv'] != null ? PokemonSpritesGeneration4.fromJson(json['generation-iv']) : null,
        generation5: json['generation-v'] != null ? PokemonSpritesGeneration5.fromJson(json['generation-v']) : null,
        generation6: json['generation-vi'] != null ? PokemonSpritesGeneration6.fromJson(json['generation-vi']) : null,
        generation7: json['generation-vii'] != null ? PokemonSpritesGeneration7.fromJson(json['generation-vii']) : null,
        generation8:
            json['generation-viii'] != null ? PokemonSpritesGeneration8.fromJson(json['generation-viii']) : null,
      );

  Map<String, dynamic> toJson() => {
        'generation-i': generation1?.toJson(),
        'generation-ii': generation2?.toJson(),
        'generation-iii': generation3?.toJson(),
        'generation-iv': generation4?.toJson(),
        'generation-v': generation5?.toJson(),
        'generation-vi': generation6?.toJson(),
        'generation-vii': generation7?.toJson(),
        'generation-viii': generation8?.toJson(),
      };
}

class PokemonSpritesGeneration1 with ResourceBase {
  final PokemonSprites? redBlue;
  final PokemonSprites? yellow;

  @override
  final Map<String, dynamic> rawData;

  PokemonSpritesGeneration1({
    required this.rawData,
    required this.redBlue,
    required this.yellow,
  });

  factory PokemonSpritesGeneration1.fromJson(Map<String, dynamic> json) => PokemonSpritesGeneration1(
        rawData: json,
        redBlue: json['red-blue'] != null ? PokemonSprites.fromJson(json['red-blue']) : null,
        yellow: json['yellow'] != null ? PokemonSprites.fromJson(json['yellow']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'red-blue': redBlue?.toJson(),
        'yellow': yellow?.toJson(),
      };
}

class PokemonSpritesGeneration2 with ResourceBase {
  final PokemonSprites? crystal;
  final PokemonSprites? gold;
  final PokemonSprites? silver;

  @override
  final Map<String, dynamic> rawData;

  PokemonSpritesGeneration2({
    required this.rawData,
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  factory PokemonSpritesGeneration2.fromJson(Map<String, dynamic> json) => PokemonSpritesGeneration2(
        rawData: json,
        crystal: json['crystal'] != null ? PokemonSprites.fromJson(json['crystal']) : null,
        gold: json['gold'] != null ? PokemonSprites.fromJson(json['gold']) : null,
        silver: json['silver'] != null ? PokemonSprites.fromJson(json['silver']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'crystal': crystal?.toJson(),
        'gold': gold?.toJson(),
        'silver': silver?.toJson(),
      };
}

class PokemonSpritesGeneration3 with ResourceBase {
  final PokemonSprites? emerald;
  final PokemonSprites? fireredLeafgreen;
  final PokemonSprites? rubySapphire;

  @override
  final Map<String, dynamic> rawData;

  PokemonSpritesGeneration3({
    required this.rawData,
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  factory PokemonSpritesGeneration3.fromJson(Map<String, dynamic> json) => PokemonSpritesGeneration3(
        rawData: json,
        emerald: json['emerald'] != null ? PokemonSprites.fromJson(json['emerald']) : null,
        fireredLeafgreen: json['firered-leafgreen'] != null ? PokemonSprites.fromJson(json['firered-leafgreen']) : null,
        rubySapphire: json['ruby-sapphire'] != null ? PokemonSprites.fromJson(json['ruby-sapphire']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'emerald': emerald?.toJson(),
        'firered-leafgreen': fireredLeafgreen?.toJson(),
        'ruby-sapphire': rubySapphire?.toJson(),
      };
}

class PokemonSpritesGeneration4 with ResourceBase {
  final PokemonSprites? diamondPearl;
  final PokemonSprites? heartgoldSoulsilver;
  final PokemonSprites? platinum;

  @override
  final Map<String, dynamic> rawData;

  PokemonSpritesGeneration4({
    required this.rawData,
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  factory PokemonSpritesGeneration4.fromJson(Map<String, dynamic> json) => PokemonSpritesGeneration4(
        rawData: json,
        diamondPearl: json['diamond-pearl'] != null ? PokemonSprites.fromJson(json['diamond-pearl']) : null,
        heartgoldSoulsilver:
            json['heartgold-soulsilver'] != null ? PokemonSprites.fromJson(json['heartgold-soulsilver']) : null,
        platinum: json['platinum'] != null ? PokemonSprites.fromJson(json['platinum']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'diamond-pearl': diamondPearl?.toJson(),
        'heartgold-soulsilver': heartgoldSoulsilver?.toJson(),
        'platinum': platinum?.toJson(),
      };
}

class PokemonSpritesGeneration5 with ResourceBase {
  final PokemonSprites? blackWhite;

  @override
  final Map<String, dynamic> rawData;

  PokemonSpritesGeneration5({
    required this.rawData,
    required this.blackWhite,
  });

  factory PokemonSpritesGeneration5.fromJson(Map<String, dynamic> json) => PokemonSpritesGeneration5(
        rawData: json,
        blackWhite: json['black-white'] != null ? PokemonSprites.fromJson(json['black-white']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'black-white': blackWhite?.toJson(),
      };
}

class PokemonSpritesGeneration6 with ResourceBase {
  final PokemonSprites? omegarubyAlphasapphire;
  final PokemonSprites? xy;

  @override
  final Map<String, dynamic> rawData;

  PokemonSpritesGeneration6({
    required this.rawData,
    required this.omegarubyAlphasapphire,
    required this.xy,
  });

  factory PokemonSpritesGeneration6.fromJson(Map<String, dynamic> json) => PokemonSpritesGeneration6(
        rawData: json,
        omegarubyAlphasapphire:
            json['omegaruby-alphasapphire'] != null ? PokemonSprites.fromJson(json['omegaruby-alphasapphire']) : null,
        xy: json['x-y'] != null ? PokemonSprites.fromJson(json['x-y']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'omegaruby-alphasapphire': omegarubyAlphasapphire?.toJson(),
        'x-y': xy?.toJson(),
      };
}

class PokemonSpritesGeneration7 with ResourceBase {
  final PokemonSprites? icons;
  final PokemonSprites? ultraSunUltraMoon;

  @override
  final Map<String, dynamic> rawData;

  PokemonSpritesGeneration7({
    required this.rawData,
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  factory PokemonSpritesGeneration7.fromJson(Map<String, dynamic> json) => PokemonSpritesGeneration7(
        rawData: json,
        icons: json['icons'] != null ? PokemonSprites.fromJson(json['icons']) : null,
        ultraSunUltraMoon:
            json['ultra-sun-ultra-moon'] != null ? PokemonSprites.fromJson(json['ultra-sun-ultra-moon']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'icons': icons?.toJson(),
        'ultra-sun-ultra-moon': ultraSunUltraMoon?.toJson(),
      };
}

class PokemonSpritesGeneration8 with ResourceBase {
  final PokemonSprites? icons;

  @override
  final Map<String, dynamic> rawData;

  PokemonSpritesGeneration8({
    required this.rawData,
    required this.icons,
  });

  factory PokemonSpritesGeneration8.fromJson(Map<String, dynamic> json) => PokemonSpritesGeneration8(
        rawData: json,
        icons: json['icons'] != null ? PokemonSprites.fromJson(json['icons']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'icons': icons?.toJson(),
      };
}

/*
"sprites": {
  "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
  "back_female": null,
  "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png",
  "back_shiny_female": null,
  "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
  "front_female": null,
  "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png",
  "front_shiny_female": null,
  "other": {
    "dream_world": {
      "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
      "front_female": null
    },
    "home": {
      "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png",
      "front_female": null,
      "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png",
      "front_shiny_female": null
    },
    "official-artwork": {
      "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
      "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png"
    }
  },
  "versions": {
    "generation-i": {
      "red-blue": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/1.png",
        "back_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/gray/1.png",
        "back_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/back/1.png",
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/1.png",
        "front_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/gray/1.png",
        "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/1.png"
      },
      "yellow": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/1.png",
        "back_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/gray/1.png",
        "back_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/transparent/back/1.png",
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/1.png",
        "front_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/gray/1.png",
        "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/transparent/1.png"
      }
    },
    "generation-ii": {
      "crystal": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/1.png",
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/shiny/1.png",
        "back_shiny_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/back/shiny/1.png",
        "back_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/back/1.png",
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/1.png",
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/shiny/1.png",
        "front_shiny_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/shiny/1.png",
        "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/1.png"
      },
      "gold": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/1.png",
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/shiny/1.png",
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/1.png",
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/shiny/1.png",
        "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/transparent/1.png"
      },
      "silver": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/1.png",
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/shiny/1.png",
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/1.png",
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/shiny/1.png",
        "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/transparent/1.png"
      }
    },
    "generation-iii": {
      "emerald": {
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/1.png",
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/shiny/1.png"
      },
      "firered-leafgreen": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/1.png",
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/shiny/1.png",
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/1.png",
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/shiny/1.png"
      },
      "ruby-sapphire": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/1.png",
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/shiny/1.png",
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/1.png",
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/shiny/1.png"
      }
    },
    "generation-iv": {
      "diamond-pearl": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/1.png",
        "back_female": null,
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/shiny/1.png",
        "back_shiny_female": null,
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/1.png",
        "front_female": null,
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/shiny/1.png",
        "front_shiny_female": null
      },
      "heartgold-soulsilver": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/1.png",
        "back_female": null,
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/shiny/1.png",
        "back_shiny_female": null,
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/1.png",
        "front_female": null,
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/shiny/1.png",
        "front_shiny_female": null
      },
      "platinum": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/1.png",
        "back_female": null,
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/shiny/1.png",
        "back_shiny_female": null,
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/1.png",
        "front_female": null,
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/shiny/1.png",
        "front_shiny_female": null
      }
    },
    "generation-v": {
      "black-white": {
        "animated": {
          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/1.gif",
          "back_female": null,
          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/shiny/1.gif",
          "back_shiny_female": null,
          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/1.gif",
          "front_female": null,
          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/shiny/1.gif",
          "front_shiny_female": null
        },
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/1.png",
        "back_female": null,
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/shiny/1.png",
        "back_shiny_female": null,
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/1.png",
        "front_female": null,
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/shiny/1.png",
        "front_shiny_female": null
      }
    },
    "generation-vi": {
      "omegaruby-alphasapphire": {
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/1.png",
        "front_female": null,
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/shiny/1.png",
        "front_shiny_female": null
      },
      "x-y": {
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/1.png",
        "front_female": null,
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/shiny/1.png",
        "front_shiny_female": null
      }
    },
    "generation-vii": {
      "icons": {
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/1.png",
        "front_female": null
      },
      "ultra-sun-ultra-moon": {
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/1.png",
        "front_female": null,
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/shiny/1.png",
        "front_shiny_female": null
      }
    },
    "generation-viii": {
      "icons": {
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-viii/icons/1.png",
        "front_female": null
      }
    }
  }
},
*/

