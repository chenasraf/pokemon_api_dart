import 'base.dart';
import 'named_api_resource.dart';
import 'nature.dart';

class NatureStatAffectSets with ResourceBase {
  final List<NamedAPIResource> increase;
  final List<NamedAPIResource> decrease;

  @override
  Map<String, dynamic> rawData;

  NatureStatAffectSets({
    required this.rawData,
    required this.increase,
    required this.decrease,
  });

  factory NatureStatAffectSets.fromJson(Map<String, dynamic> json) {
    return NatureStatAffectSets(
      rawData: json,
      increase: json['increase'].map((e) => NamedAPIResource.fromJson(e)).toList(),
      decrease: json['decrease'].map((e) => NamedAPIResource.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'increase': increase.map((e) => e.toJson()).toList(),
      'decrease': decrease.map((e) => e.toJson()).toList(),
    };
  }
}

class NatureStatChange with ResourceBase {
  final int maxChange;
  final NamedAPIResource pokeathlonStat;

  @override
  Map<String, dynamic> rawData;

  NatureStatChange({
    required this.rawData,
    required this.maxChange,
    required this.pokeathlonStat,
  });

  factory NatureStatChange.fromJson(Map<String, dynamic> json) {
    return NatureStatChange(
      rawData: json,
      maxChange: json['max_change'],
      pokeathlonStat: NamedAPIResource.fromJson(json['pokeathlon_stat']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'max_change': maxChange,
      'pokeathlon_stat': pokeathlonStat.toJson(),
    };
  }
}

class PokeathlonStat with ResourceBase {
  final int id;
  final String name;
  final int names;
  final NaturePokeathlonStatAffectSets affectingNatures;

  @override
  Map<String, dynamic> rawData;

  PokeathlonStat({
    required this.rawData,
    required this.id,
    required this.name,
    required this.names,
    required this.affectingNatures,
  });

  factory PokeathlonStat.fromJson(Map<String, dynamic> json) {
    return PokeathlonStat(
      rawData: json,
      id: json['id'],
      name: json['name'],
      names: json['names'],
      affectingNatures: NaturePokeathlonStatAffectSets.fromJson(json['affecting_natures']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'names': names,
      'affecting_natures': affectingNatures.toJson(),
    };
  }
}

class NaturePokeathlonStatAffectSets with ResourceBase {
  final List<NaturePokeathlonStatAffect> increase;
  final List<NaturePokeathlonStatAffect> decrease;

  @override
  Map<String, dynamic> rawData;

  NaturePokeathlonStatAffectSets({
    required this.rawData,
    required this.increase,
    required this.decrease,
  });

  factory NaturePokeathlonStatAffectSets.fromJson(Map<String, dynamic> json) {
    return NaturePokeathlonStatAffectSets(
      rawData: json,
      increase: json['increase'].map((e) => NaturePokeathlonStatAffect.fromJson(e)).toList(),
      decrease: json['decrease'].map((e) => NaturePokeathlonStatAffect.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'increase': increase.map((e) => e.toJson()).toList(),
      'decrease': decrease.map((e) => e.toJson()).toList(),
    };
  }
}

class NaturePokeathlonStatAffect with ResourceBase {
  final int maxChange;
  final NamedAPIResource nature;

  @override
  Map<String, dynamic> rawData;

  NaturePokeathlonStatAffect({
    required this.rawData,
    required this.maxChange,
    required this.nature,
  });

  factory NaturePokeathlonStatAffect.fromJson(Map<String, dynamic> json) {
    return NaturePokeathlonStatAffect(
      rawData: json,
      maxChange: json['max_change'],
      nature: NamedAPIResource.fromJson(json['nature']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'max_change': maxChange,
      'nature': nature.toJson(),
    };
  }
}

class NatureResource extends NamedAPIResource<Nature> {
  NatureResource({required super.rawData, required super.name, required super.url});

  factory NatureResource.fromJson(Map<String, dynamic> json) {
    return NatureResource(
      rawData: json,
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  mapper(data) {
    return Nature.fromJson(data);
  }
}

