// To parse this JSON data, do
//
//     final masterNationalityModel = masterNationalityModelFromJson(jsonString);

import 'dart:convert';

MasterNationalityModel masterNationalityModelFromJson(String str) =>
    MasterNationalityModel.fromJson(json.decode(str));

String masterNationalityModelToJson(MasterNationalityModel data) =>
    json.encode(data.toJson());

class MasterNationalityModel {
  Results? results;
  int? status;

  MasterNationalityModel({
    this.results,
    this.status,
  });

  factory MasterNationalityModel.fromJson(Map<String, dynamic> json) =>
      MasterNationalityModel(
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
  List<Nationality>? nationalities;

  Results({
    this.nationalities,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        nationalities: json["nationalities"] == null
            ? []
            : List<Nationality>.from(
                json["nationalities"]!.map((x) => Nationality.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nationalities": nationalities == null
            ? []
            : List<dynamic>.from(nationalities!.map((x) => x.toJson())),
      };
}

class Nationality {
  int? id;
  String? nationality;
  int? status;

  Nationality({
    this.id,
    this.nationality,
    this.status,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
        id: json["id"],
        nationality: json["nationality"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nationality": nationality,
        "status": status,
      };
}
