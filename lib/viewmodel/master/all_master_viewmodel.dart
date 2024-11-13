import 'package:em/model/master/categories_model.dart';
import 'package:em/model/master/conditions_model.dart';
import 'package:em/model/master/emirates_modoel.dart';
import 'package:em/model/master/getlocaities-model.dart';
import 'package:em/model/master/household_model.dart';
import 'package:em/model/master/listings_model.dart';
import 'package:em/model/master/nationality_moodel.dart';
import 'package:em/model/master/propertytype-model.dart';
import 'package:em/model/master/relisting_model.dart';
import 'package:em/model/master/roomType-model.dart';
import 'package:em/repository/allMaster/master_repository.dart';
import 'package:flutter/material.dart';

import '../../model/master/age-model.dart';
import '../../model/master/package_model.dart';
import '../../model/master/select_subtype_as_on_type.dart';
import '../../static/flutter_toast_message/toast_messge.dart';

class MasterViewModel extends ChangeNotifier {
  bool isloading = false;
  isLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  MasterAgeModel? age;
  MasterCategoriesModel? categorys;
  MasterConditionsModel? conditions;
  MasterEmiratesModel? emiratemodel;
  MasterHouseHoldModel? houseHoldModel;
  SelectSubtypeAsOnType? houseHoldSubtypeModel;
  MasterNationalityModel? nationalityModel;
  MasterPrpertyTypeModel? prpertyTypeModel;
  MasterListingsModel? listingsModel;
  MasterRelistingsModel? relistingsModel;
  MasterRoomTypeModel? roomTpemodel;
  MasterGetLocalitiesModel? getlocalities;
  MasterGetLocalitiesModel? getlocalitiesHome;
  SelectSubtypeAsOnType? selectSubtype;
  PackageModel? packageModel;

  SelectSubtypeAsOnType? get subtypeHouseRental => selectSubtype;

  // var typeof = [
  //   ageViewmodel()
  //   // MasterRepository().allmasterData(type: 'age'),
  //   // MasterRepository().allmasterData(type: 'categories'),
  //   // MasterRepository().allmasterData(type: 'conditions'),
  //   // MasterRepository().allmasterData(type: 'emirates'),
  //   // MasterRepository().allmasterData(type: 'houseHoldSubTypes'),
  //   // MasterRepository().allmasterData(type: 'houseHolds'),
  //   // MasterRepository().allmasterData(type: 'nationalities'),
  //   // MasterRepository().allmasterData(type: 'propertyType'),
  //   // MasterRepository().allmasterData(type: 'listings'),
  //   // MasterRepository().allmasterData(type: 'reListings'),
  //   // MasterRepository().allmasterData(type: 'roomTypes')
  // ];
  // MasterGetLocalitiesModel? get getlocalities => _getlocalities;
  Future ageViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'age');
    age = MasterAgeModel.fromJson(res);
    // if (res["status"] == 200) {
    //   age = MasterAgeModel.fromJson(res);

    // }
    notifyListeners();
  }

  Future getlocalityViewmodel({required id}) async {
    try {
      var res = await MasterRepository().getlocalities(emiratesID: id);
      if (res["status"] == 200) {
        getlocalities = MasterGetLocalitiesModel.fromJson(res);
      }
    } catch (e) {
      print(e);
    }

    // if (res["status"] == 200) {
    //   age = MasterAgeModel.fromJson(res);

    // }
    notifyListeners();
  }

  Future getlocalityViewmodelHome({required id}) async {
    try {
      var res = await MasterRepository().getlocalities(emiratesID: id);
      if (res["status"] == 200) {
        getlocalitiesHome = MasterGetLocalitiesModel.fromJson(res);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }

    // if (res["status"] == 200) {
    //   age = MasterAgeModel.fromJson(res);

    // }
    notifyListeners();
  }

  Future findSubtypeBuType({required id}) async {
    var res = await MasterRepository().findSubtypeBuType(house_hold_id: id);
    if (res["status"] == 200) {
      // selectSubtype = SelectSubtypeAsOnType.fromJson(res);
      houseHoldSubtypeModel = SelectSubtypeAsOnType.fromJson(res);
      notifyListeners();
    }
    notifyListeners();
  }

  Future findSubtypeBuTypeSale({required id}) async {
    var res = await MasterRepository().findSubtypeBuType(house_hold_id: id);
    if (res["status"] == 200) {
      selectSubtype = SelectSubtypeAsOnType.fromJson(res);
      // houseHoldSubtypeModel = SelectSubtypeAsOnType.fromJson(res);
    }
    notifyListeners();
  }

  Future categoriesViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'categories');

    // if (res["status"] == 200) {
    categorys = MasterCategoriesModel.fromJson(res);
    // }
    notifyListeners();
  }

  Future ConditionViewModel() async {
    var res = await MasterRepository().allmasterData(type: 'conditions');

    // if (res["status"] == 200) {
    conditions = MasterConditionsModel.fromJson(res);
    // }
    notifyListeners();
  }

  Future nulllocality() async {
    getlocalities = MasterGetLocalitiesModel();
    notifyListeners();
  }

  Future emirateViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'emirates');

    // if (res["status"] == 200) {
    emiratemodel = MasterEmiratesModel.fromJson(res);
    // }
    notifyListeners();
  }

  Future houseHoldSubTypesViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'houseHoldSubTypes');

    // if (res["status"] == 200) {
    houseHoldSubtypeModel = SelectSubtypeAsOnType.fromJson(res);
    // }
    notifyListeners();
  }

  Future householdViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'houseHolds');

    // if (res["status"] == 200) {
    houseHoldModel = MasterHouseHoldModel.fromJson(res);
    // }
    notifyListeners();
  }

  Future nationalitiesViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'nationalities');

    // if (res["status"] == 200) {
    nationalityModel = MasterNationalityModel.fromJson(res);
    // }
    notifyListeners();
  }

  Future propertyTypeViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'propertyType');

    // if (res["status"] == 200) {
    prpertyTypeModel = MasterPrpertyTypeModel.fromJson(res);
    // }
    notifyListeners();
  }

  Future listingsViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'listings');

    // if (res["status"] == 200) {
    listingsModel = MasterListingsModel.fromJson(res);
    // }
    notifyListeners();
  }

  Future reListingsViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'reListings');

    // if (res["status"] == 200) {
    relistingsModel = MasterRelistingsModel.fromJson(res);
    // }
    // print(relistingsModel?.toJson());
    notifyListeners();
  }

  Future roomTypesViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'roomTypes');

    // if (res["status"] == 200) {
    roomTpemodel = MasterRoomTypeModel.fromJson(res);
    // }
    // print(roomTpemodel?.toJson());
    notifyListeners();
  }

  Future packagesViewmodel() async {
    var res = await MasterRepository().allmasterData(type: 'packages');

    // if (res["status"] == 200) {
    packageModel = PackageModel.fromJson(res);
    // }
    // print(roomTpemodel?.toJson());
    notifyListeners();
  }

  allMaster() async {
    // late bool log = false;
    isLoadingTrue();
    // var res = await MasterRepository().allmasterData(type: "reListings");
    // var response =
    // try {
    // var res = await Future.wait([
    await ageViewmodel();
    await categoriesViewmodel();
    await ConditionViewModel();
    await emirateViewmodel();
    await houseHoldSubTypesViewmodel();
    await householdViewmodel();
    await nationalitiesViewmodel();
    await propertyTypeViewmodel();
    await listingsViewmodel();
    await reListingsViewmodel();
    await roomTypesViewmodel();
    await packagesViewmodel();
    // ]).then((v) {
    //   // for (var item in v) {
    //   //   // print("$item \n");
    //   //   print(age!.toJson());
    //   // }
    //   print(age?.toJson());
    // }).whenComplete(() {
    //   print("Now the Function has complete you do go for the next");
    // });
    // if (res["status"] == 200) {
    //   // print(res);
    //   // loginModel = LoginModel.fromJson(res);
    //   // ShowToast(msg: res["message"] ?? "");
    //   log = true;
    // }
    // // print(res);
    // // if (res["status"] == "exist") {
    // //   // print("Error");
    // //   // print(res["message"]);
    // //   ShowToast(msg: res["message"] ?? "");
    // // } else if (res["status"] == 200) {
    // //   // print(res);
    // //   // loginModel = LoginModel.fromJson(res);
    // //   // ShowToast(msg: res["message"] ?? "");
    // //   log = true;
    // // } else {
    // //   // print(res);
    // //   ShowToast(msg: res);
    // // }
    // } catch (e) {}

    isLoadingFalse();
    // return log;
  }
}
