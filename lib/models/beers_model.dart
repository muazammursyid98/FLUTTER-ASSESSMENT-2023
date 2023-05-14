// To parse this JSON data, do
//
//     final beersModel = beersModelFromJson(jsonString);

import 'dart:convert';

List<BeersModel> beersModelFromJson(String str) =>
    List<BeersModel>.from(json.decode(str).map((x) => BeersModel.fromJson(x)));

String beersModelToJson(List<BeersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BeersModel {
  int? id;
  String? name;
  String? tagline;
  String? firstBrewed;
  String? description;
  String? imageUrl;
  double? abv;
  double? ibu;
  int? targetFg;
  double? targetOg;
  int? ebc;
  double? srm;
  double? ph;
  double? attenuationLevel;
  BoilVolume? volume;
  BoilVolume? boilVolume;
  Method? method;
  Ingredients? ingredients;
  List<String>? foodPairing;
  String? brewersTips;
  String? contributedBy;
  bool? isSelected;

  BeersModel({
    this.id,
    this.name,
    this.tagline,
    this.firstBrewed,
    this.description,
    this.imageUrl,
    this.abv,
    this.ibu,
    this.targetFg,
    this.targetOg,
    this.ebc,
    this.srm,
    this.ph,
    this.attenuationLevel,
    this.volume,
    this.boilVolume,
    this.method,
    this.ingredients,
    this.foodPairing,
    this.brewersTips,
    this.contributedBy,
    this.isSelected,
  });

  factory BeersModel.fromJson(Map<String, dynamic> json) => BeersModel(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        firstBrewed: json["first_brewed"],
        description: json["description"],
        imageUrl: json["image_url"],
        abv: json["abv"]?.toDouble(),
        ibu: json["ibu"]?.toDouble(),
        targetFg: json["target_fg"],
        targetOg: json["target_og"]?.toDouble(),
        ebc: json["ebc"],
        srm: json["srm"]?.toDouble(),
        ph: json["ph"]?.toDouble(),
        attenuationLevel: json["attenuation_level"]?.toDouble(),
        volume:
            json["volume"] == null ? null : BoilVolume.fromJson(json["volume"]),
        boilVolume: json["boil_volume"] == null
            ? null
            : BoilVolume.fromJson(json["boil_volume"]),
        method: json["method"] == null ? null : Method.fromJson(json["method"]),
        ingredients: json["ingredients"] == null
            ? null
            : Ingredients.fromJson(json["ingredients"]),
        foodPairing: json["food_pairing"] == null
            ? []
            : List<String>.from(json["food_pairing"]!.map((x) => x)),
        brewersTips: json["brewers_tips"],
        contributedBy: json["contributed_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "first_brewed": firstBrewed,
        "description": description,
        "image_url": imageUrl,
        "abv": abv,
        "ibu": ibu,
        "target_fg": targetFg,
        "target_og": targetOg,
        "ebc": ebc,
        "srm": srm,
        "ph": ph,
        "attenuation_level": attenuationLevel,
        "volume": volume?.toJson(),
        "boil_volume": boilVolume?.toJson(),
        "method": method?.toJson(),
        "ingredients": ingredients?.toJson(),
        "food_pairing": foodPairing == null
            ? []
            : List<dynamic>.from(foodPairing!.map((x) => x)),
        "brewers_tips": brewersTips,
        "contributed_by": contributedBy,
      };
}

class BoilVolume {
  double? value;
  String? unit;

  BoilVolume({
    this.value,
    this.unit,
  });

  factory BoilVolume.fromJson(Map<String, dynamic> json) => BoilVolume(
        value: json["value"]?.toDouble(),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unit,
      };
}

class Ingredients {
  List<Malt>? malt;
  List<Hop>? hops;
  String? yeast;

  Ingredients({
    this.malt,
    this.hops,
    this.yeast,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        malt: json["malt"] == null
            ? []
            : List<Malt>.from(json["malt"]!.map((x) => Malt.fromJson(x))),
        hops: json["hops"] == null
            ? []
            : List<Hop>.from(json["hops"]!.map((x) => Hop.fromJson(x))),
        yeast: json["yeast"],
      );

  Map<String, dynamic> toJson() => {
        "malt": malt == null
            ? []
            : List<dynamic>.from(malt!.map((x) => x.toJson())),
        "hops": hops == null
            ? []
            : List<dynamic>.from(hops!.map((x) => x.toJson())),
        "yeast": yeast,
      };
}

class Hop {
  String? name;
  BoilVolume? amount;
  String? add;
  String? attribute;

  Hop({
    this.name,
    this.amount,
    this.add,
    this.attribute,
  });

  factory Hop.fromJson(Map<String, dynamic> json) => Hop(
        name: json["name"],
        amount:
            json["amount"] == null ? null : BoilVolume.fromJson(json["amount"]),
        add: json["add"],
        attribute: json["attribute"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount?.toJson(),
        "add": add,
        "attribute": attribute,
      };
}

class Malt {
  String? name;
  BoilVolume? amount;

  Malt({
    this.name,
    this.amount,
  });

  factory Malt.fromJson(Map<String, dynamic> json) => Malt(
        name: json["name"],
        amount:
            json["amount"] == null ? null : BoilVolume.fromJson(json["amount"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount?.toJson(),
      };
}

class Method {
  List<MashTemp>? mashTemp;
  Fermentation? fermentation;
  String? twist;

  Method({
    this.mashTemp,
    this.fermentation,
    this.twist,
  });

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        mashTemp: json["mash_temp"] == null
            ? []
            : List<MashTemp>.from(
                json["mash_temp"]!.map((x) => MashTemp.fromJson(x))),
        fermentation: json["fermentation"] == null
            ? null
            : Fermentation.fromJson(json["fermentation"]),
        twist: json["twist"],
      );

  Map<String, dynamic> toJson() => {
        "mash_temp": mashTemp == null
            ? []
            : List<dynamic>.from(mashTemp!.map((x) => x.toJson())),
        "fermentation": fermentation?.toJson(),
        "twist": twist,
      };
}

class Fermentation {
  BoilVolume? temp;

  Fermentation({
    this.temp,
  });

  factory Fermentation.fromJson(Map<String, dynamic> json) => Fermentation(
        temp: json["temp"] == null ? null : BoilVolume.fromJson(json["temp"]),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp?.toJson(),
      };
}

class MashTemp {
  BoilVolume? temp;
  int? duration;

  MashTemp({
    this.temp,
    this.duration,
  });

  factory MashTemp.fromJson(Map<String, dynamic> json) => MashTemp(
        temp: json["temp"] == null ? null : BoilVolume.fromJson(json["temp"]),
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp?.toJson(),
        "duration": duration,
      };
}
