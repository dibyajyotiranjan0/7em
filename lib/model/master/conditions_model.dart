// To parse this JSON data, do
//
//     final masterConditionsModel = masterConditionsModelFromJson(jsonString);

import 'dart:convert';

MasterConditionsModel masterConditionsModelFromJson(String str) =>
    MasterConditionsModel.fromJson(json.decode(str));

String masterConditionsModelToJson(MasterConditionsModel data) =>
    json.encode(data.toJson());

class MasterConditionsModel {
  Results? results;
  int? status;

  MasterConditionsModel({
    this.results,
    this.status,
  });

  factory MasterConditionsModel.fromJson(Map<String, dynamic> json) =>
      MasterConditionsModel(
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
  List<Condition>? conditions;

  Results({
    this.conditions,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        conditions: json["conditions"] == null
            ? []
            : List<Condition>.from(
                json["conditions"]!.map((x) => Condition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "conditions": conditions == null
            ? []
            : List<dynamic>.from(conditions!.map((x) => x.toJson())),
      };
}

class Condition {
  int? id;
  String? conditionType;
  int? status;

  Condition({
    this.id,
    this.conditionType,
    this.status,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        id: json["id"],
        conditionType: json["condition_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "condition_type": conditionType,
        "status": status,
      };
}
