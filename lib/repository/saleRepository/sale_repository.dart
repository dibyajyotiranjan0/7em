import 'package:dio/dio.dart';

import '../../data/network/api_helper.dart';
import '../../static/aapp_url-endpoint.dart';

class SaleRepository {
  Future<dynamic> realstateSale(
      {required String title,
      required String description,
      required String re_listing_type_id,
      required String emirates_id,
      required String locality,
      required String property_type_id,
      required String room_type_id,
      required String price,
      // required String no_of_cheque,
      required String available_from,
      // required String nationality,
      required String category_id,
      required String package_id,

      // required String household_type_id,
      // required String household_sub_type_id,
      // required String condition_id,
      // required String appliance_age_id,

      required String created_by,
      required List<dynamic> images}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'title': title,
        'locality': locality,
        'description': description,
        'price': price,
        'emirates_id': emirates_id,
        'package_id': package_id,
        're_listing_type_id': re_listing_type_id,
        'property_type_id': property_type_id,
        'room_type_id': room_type_id,
        // 'no_of_cheque': no_of_cheque,
        'available_from': available_from,
        // 'household_type_id': household_type_id,
        // 'household_sub_type_id': household_sub_type_id,
        // 'condition_id': condition_id,
        // 'appliance_age_id': appliance_age_id,
        'category_id': category_id,
        'created_by': created_by,
        // 'images': images,
      });
      if (images.length != 0) {
        images.asMap().forEach((index, file) {
          if (file != null) {
            formData.files.add(MapEntry(
                'images[]', // This depends on your API, adjust the key accordingly
                MultipartFile.fromFileSync(file.path,
                    filename: file.path.split('/').last)));
          }
        });
      }
      response = await NetworkApiService()
          .postApi(url: AppUrl.listingSave, formData: formData);
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

  Future<dynamic> householdSale(
      {required String title,
      required String description,
      required String emirates_id,
      required String locality,
      required String household_type_id,
      required String household_sub_type_id,
      required String appliance_age_id,
      required String condition_id,
      required String price,
      required String created_by,
      required String category_id,
      required String package_id,
      required List<dynamic> images}) async {
    late var response;

    try {
      FormData formData = FormData.fromMap({
        'title': title,
        'locality': locality,
        'description': description,
        'price': price,
        'emirates_id': emirates_id,
        'package_id': package_id,
        'household_type_id': household_type_id,
        // 'household_type_id': household_type_id,
        'household_sub_type_id': household_sub_type_id,
        'condition_id': condition_id,
        'appliance_age_id': appliance_age_id,
        'category_id': category_id,
        'created_by': created_by,
        // 'images': images,
      });
      if (images.length != 0) {
        images.asMap().forEach((index, file) {
          if (file != null) {
            formData.files.add(MapEntry(
                'images[]', // This depends on your API, adjust the key accordingly
                MultipartFile.fromFileSync(file.path,
                    filename: file.path.split('/').last)));
          }
        });
      }
      response = await NetworkApiService()
          .postApi(url: AppUrl.listingSave, formData: formData);
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
