import 'package:em/repository/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:em/static/flutter_toast_message/toast_messge.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/home_model.dart';
import '../../repository/allMaster/master_repository.dart';
import '../../repository/home/home_repository.dart';

class myAdsViewmodel with ChangeNotifier {
  String htmlContent = "";
  TextEditingController deleteEmail = TextEditingController();
  bool _visible = false;
  bool isloading = false;
  SearchListingModel? myAdsModel;
  bool get visible => _visible;

  isLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  myAdsView() async {
    late bool log = false;
    isLoadingTrue();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = await preferences.getString('driverID');
    var res = await HomeApiRepository().showAlladsFromSaailer(
        start: '0', limit: '10', id: userId!); // id: userId ?? ""
    print(res);
    if (res["status"] == 200) {
      // loginModel = LoginModel.fromJson(res);
      // ShowToast(msg: res["message"] ?? "");
      myAdsModel = SearchListingModel.fromJson(res);
      log = true;
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    return log;
  }

  Future loadHtml({required String type, required key}) async {
    bool log = false;
    isLoadingTrue();
    try {
      var res = await MasterRepository().allmasterData(type: type);
      if (res["status"] == 200) {
        htmlContent = res["results"][key][0]["contants"].toString();
        log = true;
        notifyListeners();
      } else {
        print("This si the error ");
      }
    } catch (e) {
      print("catch error occur");
    }

    // if (res["status"] == 200) {
    // listingsModel = MasterListingsModel.fromJson(res);
    // }
    isLoadingFalse();
    notifyListeners();
    return log;
  }

  Future deleteAcccount() async {
    bool log = false;
    try {
      var res =
          await AuthApiRepository().deleteAccount(email: deleteEmail.text);
      if (res["status"] == "success") {
        // htmlContent = res["results"]["terms"][0]["contants"].toString();
        log = true;
        // notifyListeners();
        ShowToast(msg: res["message"]);
      } else {
        ShowToast(msg: res["message"]);
        print("This si the error ");
      }
    } catch (e) {
      print("catch error occur");
    }
    return log;
  }

  //   // if (res["status"] == 200) {
  //   // listingsModel = MasterListingsModel.fromJson(res);
  //   // }
  //   notifyListeners();
  //   return log;
  // }
  Future reactiveAd({
    id,
  }) async {
    bool log = false;
    isLoadingTrue();
    try {
      var res =
          await HomeApiRepository().reactiveAd(id: id, package_duration: "2");

      if (res["results"]["status"] == "success") {
        myAdsView();
        log = true;
        notifyListeners();
      } else {
        print("This si the error ");
      }
    } catch (e) {
      print("catch error occur");
    }

    // if (res["status"] == 200) {
    // listingsModel = MasterListingsModel.fromJson(res);
    // }
    isLoadingFalse();
    notifyListeners();
    return log;
  }
  //  Future privacyHtml() async {
  //   bool log = false;
  //   try {
  //     var res = await MasterRepository().allmasterData(type: 'Terms');
  //     if (res["status"] == 200) {
  //       htmlContent = res["results"]["terms"][0]["contants"].toString();
  //       log = true;
  //       notifyListeners();
  //     } else {
  //       print("This si the error ");
  //     }
  //   } catch (e) {
  //     print("catch error occur");
  //   }

  //   // if (res["status"] == 200) {
  //   // listingsModel = MasterListingsModel.fromJson(res);
  //   // }
  //   notifyListeners();
  //   return log;
  // }
}
