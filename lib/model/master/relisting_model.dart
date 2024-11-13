// To parse this JSON data, do
//
//     final masterRelistingsModel = masterRelistingsModelFromJson(jsonString);

import 'dart:convert';

MasterRelistingsModel masterRelistingsModelFromJson(String str) =>
    MasterRelistingsModel.fromJson(json.decode(str));

String masterRelistingsModelToJson(MasterRelistingsModel data) =>
    json.encode(data.toJson());

class MasterRelistingsModel {
  Results? results;
  int? status;

  MasterRelistingsModel({
    this.results,
    this.status,
  });

  factory MasterRelistingsModel.fromJson(Map<String, dynamic> json) =>
      MasterRelistingsModel(
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "results": results?.toJson(),
        "status": status,
      };
}

class Results {
  List<ReListing>? reListings;

  Results({
    this.reListings,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        reListings: json["reListings"] == null
            ? []
            : List<ReListing>.from(
                json["reListings"]!.map((x) => ReListing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reListings": reListings == null
            ? []
            : List<dynamic>.from(reListings!.map((x) => x.toJson())),
      };
}

class ReListing {
  int? id;
  String? listingType;
  int? status;

  ReListing({
    this.id,
    this.listingType,
    this.status,
  });

  factory ReListing.fromJson(Map<String, dynamic> json) => ReListing(
        id: json["id"],
        listingType: json["listing_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "listing_type": listingType,
        "status": status,
      };
}
