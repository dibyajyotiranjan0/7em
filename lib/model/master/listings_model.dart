// To parse this JSON data, do
//
//     final masterListingsModel = masterListingsModelFromJson(jsonString);

import 'dart:convert';

MasterListingsModel masterListingsModelFromJson(String str) =>
    MasterListingsModel.fromJson(json.decode(str));

String masterListingsModelToJson(MasterListingsModel data) =>
    json.encode(data.toJson());

class MasterListingsModel {
  Results? results;
  int? status;

  MasterListingsModel({
    this.results,
    this.status,
  });

  factory MasterListingsModel.fromJson(Map<String, dynamic> json) =>
      MasterListingsModel(
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
  List<Listing>? listings;

  Results({
    this.listings,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        listings: json["listings"] == null
            ? []
            : List<Listing>.from(
                json["listings"]!.map((x) => Listing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listings": listings == null
            ? []
            : List<dynamic>.from(listings!.map((x) => x.toJson())),
      };
}

class Listing {
  int? id;
  String? listingType;
  int? status;

  Listing({
    this.id,
    this.listingType,
    this.status,
  });

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
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
