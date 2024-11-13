import 'package:em/data/network/api_helper.dart';
import 'package:em/static/aapp_url-endpoint.dart';
import 'package:dio/dio.dart';

class MasterRepository {
  Future allmasterData({required type}) async {
    late var res;
    try {
      FormData formData = FormData.fromMap({'type': type});

      res = NetworkApiService()
          .postApi(url: AppUrl.allMaster, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        res = e.response!.data;
      } else {
        res = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return res;
  }

  Future getlocalities({required emiratesID}) async {
    late var res;
    try {
      FormData formData = FormData.fromMap({'emirate_id': emiratesID});

      res = NetworkApiService()
          .postApi(url: AppUrl.getlocalities, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        res = e.response!.data;
      } else {
        res = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return res;
  }

  Future findSubtypeBuType({required house_hold_id}) async {
    late var res;
    try {
      FormData formData = FormData.fromMap({'house_hold_id': house_hold_id});

      res = NetworkApiService()
          .postApi(url: AppUrl.gethouseHoldTypeBySubtype, formData: formData);
    } on DioException catch (e) {
      if (e.response != null) {
        res = e.response!.data;
      } else {
        res = e.message;
      }
    } catch (e) {
      throw Exception(e);
    }
    return res;
  }
}
