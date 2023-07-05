import 'base.dart';
import 'named_api_resource.dart';

class PokemonHeldItem with ResourceBase {
  final NamedAPIResource item;
  final List<PokemonHeldItemVersion> versionDetails;
  @override
  final Map<String, dynamic> rawData;

  PokemonHeldItem({
    required this.rawData,
    required this.item,
    required this.versionDetails,
  });

  factory PokemonHeldItem.fromJson(Map<String, dynamic> json) => PokemonHeldItem(
        rawData: json,
        item: NamedAPIResource.fromJson(json["item"]),
        versionDetails:
            List<PokemonHeldItemVersion>.from(json["version_details"].map((x) => PokemonHeldItemVersion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": item.toJson(),
        "version_details": List<dynamic>.from(versionDetails.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'PokemonHeldItem{item: $item, versionDetails: $versionDetails}';
  }
}

class PokemonHeldItemVersion with ResourceBase {
  PokemonHeldItemVersion({
    required this.rawData,
    required this.version,
    required this.rarity,
  });

  final NamedAPIResource version;
  final int rarity;
  @override
  final Map<String, dynamic> rawData;

  factory PokemonHeldItemVersion.fromJson(Map<String, dynamic> json) => PokemonHeldItemVersion(
        rawData: json,
        version: NamedAPIResource.fromJson(json["version"]),
        rarity: json["rarity"],
      );

  Map<String, dynamic> toJson() => {
        "version": version.toJson(),
        "rarity": rarity,
      };

  @override
  String toString() {
    return 'PokemonHeldItemVersion{version: $version, rarity: $rarity}';
  }
}

