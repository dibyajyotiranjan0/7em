// To parse this JSON data, do
//
//     final masterAgeModel = masterAgeModelFromJson(jsonString);

import 'dart:convert';

MasterAgeModel masterAgeModelFromJson(String str) =>
    MasterAgeModel.fromJson(json.decode(str));

String masterAgeModelToJson(MasterAgeModel data) => json.encode(data.toJson());

class MasterAgeModel {
  Results? results;
  int? status;

  MasterAgeModel({
    this.results,
    this.status,
  });

  factory MasterAgeModel.fromJson(Map<String, dynamic> json) => MasterAgeModel(
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
  List<Age>? ages;

  Results({
    this.ages,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        ages: json["ages"] == null
            ? []
            : List<Age>.from(json["ages"]!.map((x) => Age.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ages": ages == null
            ? []
            : List<dynamic>.from(ages!.map((x) => x.toJson())),
      };
}

class Age {
  int? id;
  String? age;
  int? status;

  Age({
    this.id,
    this.age,
    this.status,
  });

  factory Age.fromJson(Map<String, dynamic> json) => Age(
        id: json["id"],
        age: json["age"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "age": age,
        "status": status,
      };
}
