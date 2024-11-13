import 'package:dio/dio.dart';

import '../../data/network/api_helper.dart';
import '../../static/aapp_url-endpoint.dart';

class AuthApiRepository {
  Future<dynamic> signup(
      {required String name,
      required String mobilleNo,
      required String email,
      required String password}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
        'mobile_no': mobilleNo,
        'password': password,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.registration, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!.data;
      } else {
        response = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }

  Future<dynamic> loginApi(
      {required String email, required String password}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.login, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!.data;
      } else {
        response = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }

  Future<dynamic> forgetpass({required String email}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'email': email,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.forgetPassword, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!.data;
      } else {
        response = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }

  Future<dynamic> forgetpasstoMain({required String email}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'email': email,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.forgetPassword, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!.data;
      } else {
        response = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }

  Future<dynamic> checkEmail({required String email}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'email': email,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.email_check, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!.data;
      } else {
        response = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }

  Future<dynamic> passwordChange(
      {required String email,
      required String new_password,
      required String new_confirm_password}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'email': email,
        'new_password': new_password,
        'new_confirm_password': new_confirm_password
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.passwordChange, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!.data;
      } else {
        response = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }

  Future<dynamic> verifySignup(
      {required String email, required String name}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({'email': email, 'name': name});
      response = await NetworkApiService()
          .postApi(url: AppUrl.verifySignupOTP, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!.data;
      } else {
        response = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }

  Future<dynamic> deleteAccount({required String email}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({'email': email});
      response = await NetworkApiService()
          .postApi(url: AppUrl.deleteAccount, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!.data;
      } else {
        response = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
}
