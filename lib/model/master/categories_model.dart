// To parse this JSON data, do
//
//     final masterCategoriesModel = masterCategoriesModelFromJson(jsonString);

import 'dart:convert';

MasterCategoriesModel masterCategoriesModelFromJson(String str) =>
    MasterCategoriesModel.fromJson(json.decode(str));

String masterCategoriesModelToJson(MasterCategoriesModel data) =>
    json.encode(data.toJson());

class MasterCategoriesModel {
  Results? results;
  int? status;

  MasterCategoriesModel({
    this.results,
    this.status,
  });

  factory MasterCategoriesModel.fromJson(Map<String, dynamic> json) =>
      MasterCategoriesModel(
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
  List<Category>? categories;

  Results({
    this.categories,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? categoryName;
  int? status;

  Category({
    this.id,
    this.categoryName,
    this.status,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["category_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "status": status,
      };
}
