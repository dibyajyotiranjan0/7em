// To parse this JSON data, do
//
//     final masterHouseHoldModel = masterHouseHoldModelFromJson(jsonString);

import 'dart:convert';

MasterHouseHoldModel masterHouseHoldModelFromJson(String str) =>
    MasterHouseHoldModel.fromJson(json.decode(str));

String masterHouseHoldModelToJson(MasterHouseHoldModel data) =>
    json.encode(data.toJson());

class MasterHouseHoldModel {
  Results? results;
  int? status;

  MasterHouseHoldModel({
    this.results,
    this.status,
  });

  factory MasterHouseHoldModel.fromJson(Map<String, dynamic> json) =>
      MasterHouseHoldModel(
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
  List<HouseHold>? houseHolds;

  Results({
    this.houseHolds,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        houseHolds: json["houseHolds"] == null
            ? []
            : List<HouseHold>.from(
                json["houseHolds"]!.map((x) => HouseHold.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "houseHolds": houseHolds == null
            ? []
            : List<dynamic>.from(houseHolds!.map((x) => x.toJson())),
      };
}

class HouseHold {
  int? id;
  String? householdType;
  int? status;

  HouseHold({
    this.id,
    this.householdType,
    this.status,
  });

  factory HouseHold.fromJson(Map<String, dynamic> json) => HouseHold(
        id: json["id"],
        householdType: json["household_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "household_type": householdType,
        "status": status,
      };
}
