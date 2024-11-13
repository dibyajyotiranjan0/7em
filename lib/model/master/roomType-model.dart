// To parse this JSON data, do
//
//     final masterRoomTypeModel = masterRoomTypeModelFromJson(jsonString);

import 'dart:convert';

MasterRoomTypeModel masterRoomTypeModelFromJson(String str) =>
    MasterRoomTypeModel.fromJson(json.decode(str));

String masterRoomTypeModelToJson(MasterRoomTypeModel data) =>
    json.encode(data.toJson());

class MasterRoomTypeModel {
  Results? results;
  int? status;

  MasterRoomTypeModel({
    this.results,
    this.status,
  });

  factory MasterRoomTypeModel.fromJson(Map<String, dynamic> json) =>
      MasterRoomTypeModel(
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
  List<RoomType>? roomTypes;

  Results({
    this.roomTypes,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        roomTypes: json["roomTypes"] == null
            ? []
            : List<RoomType>.from(
                json["roomTypes"]!.map((x) => RoomType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "roomTypes": roomTypes == null
            ? []
            : List<dynamic>.from(roomTypes!.map((x) => x.toJson())),
      };
}

class RoomType {
  int? id;
  String? roomType;
  int? status;

  RoomType({
    this.id,
    this.roomType,
    this.status,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
        id: json["id"],
        roomType: json["room_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_type": roomType,
        "status": status,
      };
}
