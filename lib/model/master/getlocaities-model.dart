// To parse this JSON data, do
//
//     final masterGetLocalitiesModel = masterGetLocalitiesModelFromJson(jsonString);

import 'dart:convert';

MasterGetLocalitiesModel masterGetLocalitiesModelFromJson(String str) =>
    MasterGetLocalitiesModel.fromJson(json.decode(str));

String masterGetLocalitiesModelToJson(MasterGetLocalitiesModel data) =>
    json.encode(data.toJson());

class MasterGetLocalitiesModel {
  Results? results;
  int? status;

  MasterGetLocalitiesModel({
    this.results,
    this.status,
  });

  factory MasterGetLocalitiesModel.fromJson(Map<String, dynamic> json) =>
      MasterGetLocalitiesModel(
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
  List<Locality>? localities;

  Results({
    this.localities,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        localities: json["localities"] == null
            ? []
            : List<Locality>.from(
                json["localities"]!.map((x) => Locality.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "localities": localities == null
            ? []
            : List<dynamic>.from(localities!.map((x) => x.toJson())),
      };
}

class Locality {
  int? id;
  String? localityName;
  int? emirateId;
  String? emirateName;
  int? status;

  Locality({
    this.id,
    this.localityName,
    this.emirateId,
    this.emirateName,
    this.status,
  });

  factory Locality.fromJson(Map<String, dynamic> json) => Locality(
        id: json["id"],
        localityName: json["locality_name"],
        emirateId: json["emirate_id"],
        emirateName: json["emirate_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "locality_name": localityName,
        "emirate_id": emirateId,
        "emirate_name": emirateName,
        "status": status,
      };
}
