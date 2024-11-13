import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:em/model/forgotpassword_model.dart';
import 'package:em/model/login_model.dart';
import 'package:em/repository/auth/auth_repository.dart';
import 'package:em/screen/auth/forgetPassword/forget_password_screen.dart';
import 'package:em/static/flutter_toast_message/toast_messge.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/send_otp_model.dart';

class AuthViewModel extends ChangeNotifier {
  bool _visible = false;
  bool isloading = false;

  // final formkeypass = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController ForgetpasEmail = TextEditingController();
  TextEditingController ForgetpasEmailverifyOtp = TextEditingController();
  bool get visible => _visible;
  LoginModel? loginModel;
  ForgotPasswordModel? forgotPasswordModel;
  SendOtpModel? sendotpModel;
  //resistation
  TextEditingController verifyOTPSignup = TextEditingController();
  TextEditingController nameSignup = TextEditingController();
  TextEditingController emailSignup = TextEditingController();
  TextEditingController contactSignup = TextEditingController();
  TextEditingController passwordSignup = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController retypenewPass = TextEditingController();
  TextEditingController newpasswordlog = TextEditingController();
  TextEditingController retypenewPassloog = TextEditingController();
  bool _visibleSignup = false;
  bool get visibleSignup => _visibleSignup;
  passwordVisible() {
    _visible = !_visible;
    notifyListeners();
  }

  passwordVisibleSignup() {
    _visibleSignup = !_visibleSignup;
    notifyListeners();
  }

  isLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  registrationViewmodel() async {
    late bool log = false;
    isLoadingTrue();
    var res = await AuthApiRepository().signup(
        name: nameSignup.text,
        mobilleNo: contactSignup.text,
        email: emailSignup.text,
        password: passwordSignup.text);
    // print(res);
    if (res["status"] == "exist") {
      // print("Error");
      // print(res["message"]);
      verifyOTPSignup.text = "";
      ShowToast(msg: res["message"].toString() ?? "");
    } else if (res["status"] == 200) {
      // loginModel = LoginModel.fromJson(res);
      ShowToast(msg: res["results"]["message"].toString() ?? "");
      // print(res);
      verifyOTPSignup.text = "";

      log = true;
      clearResistation();
    } else {
      // print(res);
      verifyOTPSignup.text = "";
      ShowToast(msg: res);
    }
    isLoadingFalse();
    return log;
  }

  Future verifyOtpSignup() async {
    late bool log = false;
    isLoadingTrue();
    var res = await AuthApiRepository()
        .verifySignup(email: emailSignup.text, name: nameSignup.text);
    // print(res);
    if (res["status"] == "error") {
      // print("Error");
      // print(res["message"]);
      ShowToast(msg: res["message"] ?? "");
    } else if (res["status"] == "success") {
      sendotpModel = SendOtpModel.fromJson(res);
      // ShowToast(msg: res["message"] ?? "");
      // verifyOTPSignup.text = res["otp"].toString();
      // // ShowToast(msg: res["otp"] ?? "");
      // print(res);
      // forgotPasswordModel = ForgotPasswordModel.fromJson(res);
      // ShowToast(msg: forgotPasswordModel!.otp.toString());
      log = true;
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    return log;
  }

  loginviewmodel() async {
    late bool log = false;
    isLoadingTrue();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var res = await AuthApiRepository()
        .loginApi(email: email.text, password: password.text);
    print(res);
    if (res["status"] == "error") {
      // print("Error");
      // print(res["message"]);
      ShowToast(msg: res["message"] ?? "");
    } else if (res["status"] == "success") {
      loginModel = LoginModel.fromJson(res);
      log = true;
      String jsonString = jsonEncode(res["user_detail"]);
      await preferences.setString('profile', jsonString);
      await preferences.setString(
          'name', loginModel!.userDetail!.name.toString());
      await preferences.setString(
          'email', loginModel!.userDetail!.email.toString());
      await preferences.setString(
          'phone', loginModel!.userDetail!.mobileNo.toString());
      // await preferences.setString(
      // 'password', loginModel!.userDetail!.pass.toString());
      await preferences.setString(
          'driverID', loginModel!.userDetail!.id.toString());
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    return log;
  }

  ForgetPasswordRequest() async {
    late bool log = false;
    isLoadingTrue();
    var res = await AuthApiRepository().forgetpass(email: ForgetpasEmail.text);
    print(res);
    if (res["status"] == "error") {
      // print("Error");
      // print(res["message"]);
      ShowToast(msg: res["message"] ?? "");
    } else if (res["status"] == "success") {
      // loginModel = LoginModel.fromJson(res);
      ShowToast(msg: res["message"] ?? "");
      // ShowToast(msg: res["otp"] ?? "");
      // print(res);
      forgotPasswordModel = ForgotPasswordModel.fromJson(res);
      // ShowToast(msg: forgotPasswordModel!.otp.toString());
      log = true;
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    return log;
  }

  validateforgotOTP() async {
    bool log = false;
    isLoadingTrue();
    // Future.delayed(Duration(seconds: 2), () {
    if (forgotPasswordModel!.otp.toString() == ForgetpasEmailverifyOtp.text) {
      ForgetpasEmailverifyOtp.text = "";
      ShowToast(msg: "Verify Successfully");
      log = true;
    } else {
      ForgetpasEmailverifyOtp.text = "";
      ShowToast(msg: "Enter Correct OTP");
    }
    // });

    isLoadingFalse();
    return log;
  }

  changePassword() async {
    late bool log = false;
    isLoadingTrue();
    var res = await AuthApiRepository().passwordChange(
        email: ForgetpasEmail.text,
        new_password: newpassword.text,
        new_confirm_password: retypenewPass.text);
    // print(res);
    if (res["status"] == "error") {
      // print("Error");
      // print(res["message"]);
      if (newpassword.text.length >= 8) {
        ShowToast(
            msg: res["errors"]["new_confirm_password"][0].toString() ?? "");
      } else {
        ShowToast(msg: res["errors"]["new_password"][0].toString() ?? "");
      }
    } else if (res["status"] == "success") {
      // loginModel = LoginModel.fromJson(res);
      ShowToast(msg: res["message"].toString() ?? "");
      // ShowToast(msg: res["otp"] ?? "");
      print(res);
      // forgotPasswordModel = ForgotPasswordModel.fromJson(res);
      log = true;
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    return log;
  }

  Future verifyEmail() async {
    late bool log = false;
    isLoadingTrue();
    var res = await AuthApiRepository().checkEmail(email: emailSignup.text);
    // print(res);
    if (res["status"] == "warning") {
      // print("Error");
      // print(res["message"]);
      ShowToast(msg: res["message"].toString() ?? "");
    } else if (res["status"] == "success") {
      // loginModel = LoginModel.fromJson(res);
      // ShowToast(msg: res["message"].toString() ?? "");
      // ShowToast(msg: res["otp"] ?? "");
      // print(res);
      // forgotPasswordModel = ForgotPasswordModel.fromJson(res);
      log = true;
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    return log;
  }

  // change password login
  changePasswordlog() async {
    isLoadingTrue();
    late bool log = false;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var email = await preferences.getString('email');

    var res = await AuthApiRepository().passwordChange(
        email: email!,
        new_password: newpasswordlog.text,
        new_confirm_password: retypenewPassloog.text);
    // print(res);
    if (res["status"] == "error") {
      // print("Error");
      // print(res["message"]);
      ShowToast(msg: res["errors"].toString() ?? "");
    } else if (res["status"] == "success") {
      // loginModel = LoginModel.fromJson(res);
      ShowToast(msg: res["message"].toString() ?? "");
      // ShowToast(msg: res["otp"] ?? "");
      print(res);
      // forgotPasswordModel = ForgotPasswordModel.fromJson(res);
      log = true;
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    return log;
  }

  Future Logout() async {
    bool log = false;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('driverID');
    await preferences.remove('name');
    await preferences.remove('email');
    await preferences.remove('phone');
    log = true;
    return log;
  }

  clearResistation() {
    nameSignup.text = '';
    contactSignup.text = '';
    emailSignup.text = '';
    passwordSignup.text = '';
    notifyListeners();
  }
}
