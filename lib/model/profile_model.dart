// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  String? status;
  Data? data;

  UserProfileModel({
    this.status,
    this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? password;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  dynamic twoFactorConfirmedAt;
  dynamic rememberToken;
  int? accountActivation;
  dynamic ipAddress;
  dynamic lastLoginDate;
  int? roleId;
  dynamic designationId;
  int? mobileNo;
  dynamic userImage;
  dynamic balance;
  int? status;
  int? createdBy;
  String? createdAt;
  dynamic updatedBy;
  String? updatedAt;
  String? currency;

  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.rememberToken,
    this.accountActivation,
    this.ipAddress,
    this.lastLoginDate,
    this.roleId,
    this.designationId,
    this.mobileNo,
    this.userImage,
    this.balance,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.currency,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"],
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        rememberToken: json["remember_token"],
        accountActivation: json["account_activation"],
        ipAddress: json["ip_address"],
        lastLoginDate: json["last_login_date"],
        roleId: json["role_id"],
        designationId: json["designation_id"],
        mobileNo: json["mobile_no"],
        userImage: json["user_image"],
        balance: json["balance"],
        status: json["status"],
        createdBy: json["created_by"],
        createdAt: json["created_at"],
        updatedBy: json["updated_by"],
        updatedAt: json["updated_at"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "password": password,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "remember_token": rememberToken,
        "account_activation": accountActivation,
        "ip_address": ipAddress,
        "last_login_date": lastLoginDate,
        "role_id": roleId,
        "designation_id": designationId,
        "mobile_no": mobileNo,
        "user_image": userImage,
        "balance": balance,
        "status": status,
        "created_by": createdBy,
        "created_at": createdAt,
        "updated_by": updatedBy,
        "updated_at": updatedAt,
        "currency": currency,
      };
}
