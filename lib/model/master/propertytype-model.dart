// To parse this JSON data, do
//
//     final masterPrpertyTypeModel = masterPrpertyTypeModelFromJson(jsonString);

import 'dart:convert';

MasterPrpertyTypeModel masterPrpertyTypeModelFromJson(String str) =>
    MasterPrpertyTypeModel.fromJson(json.decode(str));

String masterPrpertyTypeModelToJson(MasterPrpertyTypeModel data) =>
    json.encode(data.toJson());

class MasterPrpertyTypeModel {
  Results? results;
  int? status;

  MasterPrpertyTypeModel({
    this.results,
    this.status,
  });

  factory MasterPrpertyTypeModel.fromJson(Map<String, dynamic> json) =>
      MasterPrpertyTypeModel(
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
  List<PropertyType>? propertyType;

  Results({
    this.propertyType,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        propertyType: json["propertyType"] == null
            ? []
            : List<PropertyType>.from(
                json["propertyType"]!.map((x) => PropertyType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "propertyType": propertyType == null
            ? []
            : List<dynamic>.from(propertyType!.map((x) => x.toJson())),
      };
}

class PropertyType {
  int? id;
  String? propertyType;
  int? status;

  PropertyType({
    this.id,
    this.propertyType,
    this.status,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
        id: json["id"],
        propertyType: json["property_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_type": propertyType,
        "status": status,
      };
}
