// To parse this JSON data, do
//
//     final selectSubtypeAsOnType = selectSubtypeAsOnTypeFromJson(jsonString);

import 'dart:convert';

SelectSubtypeAsOnType selectSubtypeAsOnTypeFromJson(String str) =>
    SelectSubtypeAsOnType.fromJson(json.decode(str));

String selectSubtypeAsOnTypeToJson(SelectSubtypeAsOnType data) =>
    json.encode(data.toJson());

class SelectSubtypeAsOnType {
  Results? results;
  int? status;

  SelectSubtypeAsOnType({
    this.results,
    this.status,
  });

  factory SelectSubtypeAsOnType.fromJson(Map<String, dynamic> json) =>
      SelectSubtypeAsOnType(
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
  List<HouseHoldSubType>? houseHoldSubType;

  Results({
    this.houseHoldSubType,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        houseHoldSubType: json["houseHoldSubType"] == null
            ? []
            : List<HouseHoldSubType>.from(json["houseHoldSubType"]!
                .map((x) => HouseHoldSubType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "houseHoldSubType": houseHoldSubType == null
            ? []
            : List<dynamic>.from(houseHoldSubType!.map((x) => x.toJson())),
      };
}

class HouseHoldSubType {
  int? id;
  String? subType;
  int? houseHoldId;
  String? householdType;
  int? status;

  HouseHoldSubType({
    this.id,
    this.subType,
    this.houseHoldId,
    this.householdType,
    this.status,
  });

  factory HouseHoldSubType.fromJson(Map<String, dynamic> json) =>
      HouseHoldSubType(
        id: json["id"],
        subType: json["sub_type"],
        houseHoldId: json["house_hold_id"],
        householdType: json["household_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sub_type": subType,
        "house_hold_id": houseHoldId,
        "household_type": householdType,
        "status": status,
      };
}
