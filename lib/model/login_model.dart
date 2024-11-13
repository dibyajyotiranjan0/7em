// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? status;
  UserDetail? userDetail;

  LoginModel({
    this.status,
    this.userDetail,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        userDetail: json["user_detail"] == null
            ? null
            : UserDetail.fromJson(json["user_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user_detail": userDetail?.toJson(),
      };
}

class UserDetail {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  dynamic twoFactorConfirmedAt;
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

  UserDetail({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
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

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
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
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
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
