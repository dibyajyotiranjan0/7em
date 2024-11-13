// To parse this JSON data, do
//
//     final searchListingModel = searchListingModelFromJson(jsonString);

import 'dart:convert';

SearchListingModel searchListingModelFromJson(String str) =>
    SearchListingModel.fromJson(json.decode(str));

String searchListingModelToJson(SearchListingModel data) =>
    json.encode(data.toJson());

class SearchListingModel {
  Results? results;
  int? status;

  SearchListingModel({
    this.results,
    this.status,
  });

  factory SearchListingModel.fromJson(Map<String, dynamic> json) =>
      SearchListingModel(
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
  List<Listing>? listings;
  int? totalCount;
  String? message;

  Results({
    this.listings,
    this.totalCount,
    this.message,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        listings: json["listings"] == null
            ? []
            : List<Listing>.from(
                json["listings"]!.map((x) => Listing.fromJson(x))),
        totalCount: json["total_count"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "listings": listings == null
            ? []
            : List<dynamic>.from(listings!.map((x) => x.toJson())),
        "total_count": totalCount,
        "message": message,
      };
}

class Listing {
  int? id;
  String? title;
  String? description;
  int? price;
  int? emiratesId;
  int? categoryId;
  String? categoryName;
  String? emirateName;
  int? reListingTypeId;
  String? reListingTypeName;
  int? propertyTypeId;
  String? propertyType;
  int? roomTypeId;
  String? roomType;
  int? noOfCheque;
  String? availableFrom;
  dynamic householdTypeId;
  dynamic householdType;
  dynamic conditionType;
  dynamic nationalityName;
  dynamic householdSubTypeId;
  dynamic conditionId;
  dynamic subType;
  dynamic applianceAgeId;
  dynamic age;
  dynamic nationalityId;
  dynamic totalViews;
  String? status;
  String? userName;
  String? userEmail;
  int? userMobile;
  String? createdAt;
  int? createdBy;
  String? currency;
  dynamic packageName;
  dynamic packageAmount;
  dynamic packageDuration;
  dynamic packageStartDate;
  dynamic packageEndDate;
  int? localityId;
  String? localityName;
  List<Image2>? images;

  Listing({
    this.id,
    this.title,
    this.description,
    this.price,
    this.emiratesId,
    this.categoryId,
    this.categoryName,
    this.emirateName,
    this.reListingTypeId,
    this.reListingTypeName,
    this.propertyTypeId,
    this.propertyType,
    this.roomTypeId,
    this.roomType,
    this.noOfCheque,
    this.availableFrom,
    this.householdTypeId,
    this.householdType,
    this.conditionType,
    this.nationalityName,
    this.householdSubTypeId,
    this.conditionId,
    this.subType,
    this.applianceAgeId,
    this.age,
    this.nationalityId,
    this.totalViews,
    this.status,
    this.userName,
    this.userEmail,
    this.userMobile,
    this.createdAt,
    this.createdBy,
    this.currency,
    this.packageName,
    this.packageAmount,
    this.packageDuration,
    this.packageStartDate,
    this.packageEndDate,
    this.localityId,
    this.localityName,
    this.images,
  });

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        emiratesId: json["emirates_id"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        emirateName: json["emirate_name"],
        reListingTypeId: json["re_listing_type_id"],
        reListingTypeName: json["re_listing_type_name"],
        propertyTypeId: json["property_type_id"],
        propertyType: json["property_type"],
        roomTypeId: json["room_type_id"],
        roomType: json["room_type"],
        noOfCheque: json["no_of_cheque"],
        availableFrom: json["available_from"],
        householdTypeId: json["household_type_id"],
        householdType: json["household_type"],
        conditionType: json["condition_type"],
        nationalityName: json["nationality_name"],
        householdSubTypeId: json["household_sub_type_id"],
        conditionId: json["condition_id"],
        subType: json["sub_type"],
        applianceAgeId: json["appliance_age_id"],
        age: json["age"],
        nationalityId: json["nationality_id"],
        totalViews: json["total_views"],
        status: json["status"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userMobile: json["user_mobile"],
        createdAt: json["created_at"],
        createdBy: json["created_by"],
        currency: json["currency"],
        packageName: json["package_name"],
        packageAmount: json["package_amount"],
        packageDuration: json["package_duration"],
        packageStartDate: json["package_start_date"],
        packageEndDate: json["package_end_date"],
        localityId: json["locality_id"],
        localityName: json["locality_name"],
        images: json["images"] == null
            ? []
            : List<Image2>.from(json["images"]!.map((x) => Image2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "emirates_id": emiratesId,
        "category_id": categoryId,
        "category_name": categoryName,
        "emirate_name": emirateName,
        "re_listing_type_id": reListingTypeId,
        "re_listing_type_name": reListingTypeName,
        "property_type_id": propertyTypeId,
        "property_type": propertyType,
        "room_type_id": roomTypeId,
        "room_type": roomType,
        "no_of_cheque": noOfCheque,
        "available_from": availableFrom,
        "household_type_id": householdTypeId,
        "household_type": householdType,
        "condition_type": conditionType,
        "nationality_name": nationalityName,
        "household_sub_type_id": householdSubTypeId,
        "condition_id": conditionId,
        "sub_type": subType,
        "appliance_age_id": applianceAgeId,
        "age": age,
        "nationality_id": nationalityId,
        "total_views": totalViews,
        "status": status,
        "user_name": userName,
        "user_email": userEmail,
        "user_mobile": userMobile,
        "created_at": createdAt,
        "created_by": createdBy,
        "currency": currency,
        "package_name": packageName,
        "package_amount": packageAmount,
        "package_duration": packageDuration,
        "package_start_date": packageStartDate,
        "package_end_date": packageEndDate,
        "locality_id": localityId,
        "locality_name": localityName,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Image2 {
  int? id;
  int? listingId;
  String? image2;

  Image2({
    this.id,
    this.listingId,
    this.image2,
  });

  factory Image2.fromJson(Map<String, dynamic> json) => Image2(
        id: json["id"],
        listingId: json["listing_id"],
        image2: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "listing_id": listingId,
        "image": image2,
      };
}
