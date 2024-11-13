// To parse this JSON data, do
//
//     final packageModel = packageModelFromJson(jsonString);

import 'dart:convert';

PackageModel packageModelFromJson(String str) =>
    PackageModel.fromJson(json.decode(str));

String packageModelToJson(PackageModel data) => json.encode(data.toJson());

class PackageModel {
  Results? results;
  int? status;

  PackageModel({
    this.results,
    this.status,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
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
  List<Package>? packages;

  Results({
    this.packages,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        packages: json["packages"] == null
            ? []
            : List<Package>.from(
                json["packages"]!.map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "packages": packages == null
            ? []
            : List<dynamic>.from(packages!.map((x) => x.toJson())),
      };
}

class Package {
  int? id;
  String? packageName;
  int? amount;
  int? duration;
  int? status;
  String? currency;

  Package({
    this.id,
    this.packageName,
    this.amount,
    this.duration,
    this.status,
    this.currency,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        packageName: json["package_name"],
        amount: json["amount"],
        duration: json["duration"],
        status: json["status"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "package_name": packageName,
        "amount": amount,
        "duration": duration,
        "status": status,
        "currency": currency,
      };
}
