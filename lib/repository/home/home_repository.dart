import 'package:dio/dio.dart';

import '../../data/network/api_helper.dart';
import '../../static/aapp_url-endpoint.dart';

class HomeApiRepository {
  Future<dynamic> home({required String start, required String limit}) async {
    //required String id
    late var response;

    try {
      FormData formData =
          FormData.fromMap({'start': start, 'limit': limit}); //'id': id
      response = await NetworkApiService()
          .postApi(url: AppUrl.listingList, formData: formData);
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

  Future<dynamic> profile({required String email}) async {
    //required String id
    late var response;

    try {
      FormData formData = FormData.fromMap({'email': email}); //'id': id
      response = await NetworkApiService()
          .postApi(url: AppUrl.userProfile, formData: formData);
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

  Future<dynamic> realState({
    required String re_listing_type_id,
    required String emirates_id,
    required String locality,
    required String property_type_id,
    required String room_type_id,
    required String fromAmount,
    required String toAmount,
    required String available_from,
    // required String nationality,

    required String category_id,

    // required String localitys,

    // required String household_type_id,
    // required String household_sub_type_id,
    // required String condition_id,
    // required String appliance_age_id,
  }) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'locality': locality,
        // 'price': price,
        'emirates_id': emirates_id,
        'category_id': category_id,
        're_listing_type_id': re_listing_type_id,
        'property_type_id': property_type_id,
        'room_type_id': room_type_id,
        'available_from': available_from,
        'from_amount': fromAmount,
        'to_amount': toAmount,
        // 'household_type_id': household_type_id,
        // 'household_sub_type_id': household_sub_type_id,
        // 'condition_id': condition_id,
        // 'appliance_age_id': appliance_age_id,
        // 'nationality': nationality,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.listingList, formData: formData);
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

  Future<dynamic> houseHold(
      {required String emirates_id,
      required String locality,
      // required String price,

      required String category_id,

      // required String localitys,

      required String household_type_id,
      required String household_sub_type_id,
      required String condition_id,
      required String appliance_age_id,
      required String fromAmount,
      required String toAmount}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'locality': locality,
        // 'price': price,
        'emirates_id': emirates_id,
        'category_id': category_id,
        'household_type_id': household_type_id,
        'household_sub_type_id': household_sub_type_id,
        'condition_id': condition_id,
        'appliance_age_id': appliance_age_id,
        'from_amount': fromAmount,
        'to_amount': toAmount,
      });
      response = await NetworkApiService()
          .postApi(url: AppUrl.listingList, formData: formData);
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

  Future<dynamic> showAlladsFromSaailer(
      {required String start,
      required String limit,
      required String id}) async {
    //required String id
    late var response;

    try {
      FormData formData = FormData.fromMap(
          {'start': start, 'limit': limit, 'created_by': id}); //'id': id
      response = await NetworkApiService()
          .postApi(url: AppUrl.listingList, formData: formData);
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

  Future<dynamic> reactiveAd(
      {required String id, required String package_duration}) async {
    //required String id
    late var response;

    try {
      FormData formData = FormData.fromMap(
          {'id': id, 'package_duration': package_duration}); //'id': id
      response = await NetworkApiService()
          .postApi(url: AppUrl.reactivate, formData: formData);
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
