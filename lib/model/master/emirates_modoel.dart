// To parse this JSON data, do
//
//     final masterEmiratesModel = masterEmiratesModelFromJson(jsonString);

import 'dart:convert';

MasterEmiratesModel masterEmiratesModelFromJson(String str) =>
    MasterEmiratesModel.fromJson(json.decode(str));

String masterEmiratesModelToJson(MasterEmiratesModel data) =>
    json.encode(data.toJson());

class MasterEmiratesModel {
  Results? results;
  int? status;

  MasterEmiratesModel({
    this.results,
    this.status,
  });

  factory MasterEmiratesModel.fromJson(Map<String, dynamic> json) =>
      MasterEmiratesModel(
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
  List<Emirate>? emirates;

  Results({
    this.emirates,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        emirates: json["emirates"] == null
            ? []
            : List<Emirate>.from(
                json["emirates"]!.map((x) => Emirate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "emirates": emirates == null
            ? []
            : List<dynamic>.from(emirates!.map((x) => x.toJson())),
      };
}

class Emirate {
  int? id;
  String? emirateName;
  int? status;

  Emirate({
    this.id,
    this.emirateName,
    this.status,
  });

  factory Emirate.fromJson(Map<String, dynamic> json) => Emirate(
        id: json["id"],
        emirateName: json["emirate_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "emirate_name": emirateName,
        "status": status,
      };
}
