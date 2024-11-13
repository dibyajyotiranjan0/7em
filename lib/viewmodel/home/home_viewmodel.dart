import 'dart:async';
import 'dart:io';
import 'package:em/model/forgotpassword_model.dart';
import 'package:em/model/login_model.dart';
import 'package:em/repository/auth/auth_repository.dart';
import 'package:em/repository/home/home_repository.dart';
import 'package:em/screen/auth/forgetPassword/forget_password_screen.dart';
import 'package:em/static/flutter_toast_message/toast_messge.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/home_model.dart';
import '../../model/master/age-model.dart';
import '../../model/master/conditions_model.dart';
import '../../model/master/emirates_modoel.dart';
import '../../model/master/getlocaities-model.dart';
import '../../model/master/household_model.dart';
import '../../model/master/nationality_moodel.dart';
import '../../model/master/propertytype-model.dart';
import '../../model/master/relisting_model.dart';
import '../../model/master/roomType-model.dart';
import '../../model/master/select_subtype_as_on_type.dart';
import '../../model/profile_model.dart';

class HomeViewModel extends ChangeNotifier {
  bool _visible = false;
  bool isloading = false;
  SearchListingModel? homeModel;
  SearchListingModel? showAllAdsPerticularSailer;
  UserProfileModel? profile;
  //

  RangeValues currentRealState = const RangeValues(500, 50000000);

  // final formkeypass = GlobalKey<FormState>();
  // final formkeySignup = GlobalKey<FormState>();
  // TextEditingController name = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController contact = TextEditingController();
  // TextEditingController password = TextEditingController();
  // TextEditingController ForgetpasEmail = TextEditingController();
  // TextEditingController ForgetpasEmailverifyOtp = TextEditingController();
  bool get visible => _visible;
  TextEditingController datePick = TextEditingController();
  String? noCheque;
  ReListing? type;
  Emirate? emirate;
  PropertyType? propertyType;
  RoomType? roomType;
  Nationality? nationality;
  Locality? localities;
  bool isRentalSelected = true;

  //
  Emirate? emiratehousehold;
  // Emirate? emirateHouseHold;
  Locality? localitiesHouseHold;
  HouseHold? household;
  HouseHoldSubType? householdsubtype;
  Age? age;
  Condition? condition;
  RangeValues currentHomeapp = const RangeValues(100, 100000);

  Emirate? get selectedEmirate => emirate;
  Locality? get selectedLocalities => localities;
  Emirate? get selectedEmirateHouse => emiratehousehold;
  Locality? get selectedLocalitiesHouse => localitiesHouseHold;
  HouseHold? get selecthusehold => household;
  HouseHoldSubType? get selecthouseholdSubtype => householdsubtype;

  //sale
  //   Emirate? get selectedEmirate => emirate;
  // Locality? get selectedLocalities => localities;
  // Emirate? get selectedEmirateHouse => emiratehousehold;
  // Locality? get selectedLocalitiesHouse => localitiesHouseHold;
  // HouseHold? get selecthusehold => household;
  // HouseHoldSubType? get selecthouseholdSubtype => householdsubtype;

  //resistation

  isLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  homeViewmodel() async {
    late bool log = false;
    isLoadingTrue();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = await preferences.getString('driverID');
    var res = await HomeApiRepository()
        .home(start: '0', limit: '10'); // id: userId ?? ""
    if (res["status"] == 200) {
      // loginModel = LoginModel.fromJson(res);
      // ShowToast(msg: res["message"] ?? "");
      homeModel = SearchListingModel.fromJson(res);
      log = true;
      notifyListeners();
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    notifyListeners();
    return log;
  }

  showAlladsperticuralSailor({required id}) async {
    late bool log = false;
    isLoadingTrue();
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var userId = await preferences.getString('driverID');
    var res = await HomeApiRepository().showAlladsFromSaailer(
      start: '0',
      limit: '10',
      id: id,
    ); // id: userId ?? ""
    if (res["status"] == 200) {
      // loginModel = LoginModel.fromJson(res);
      // ShowToast(msg: res["message"] ?? "");
      showAllAdsPerticularSailer = SearchListingModel.fromJson(res);
      log = true;
      notifyListeners();
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    notifyListeners();
    return log;
  }

  Future selectType(bool rent) async {
    isRentalSelected = rent;
    notifyListeners();
  }

  Future selectnatinality({required Nationality releast}) async {
    nationality = releast;
    notifyListeners();
  }

  Future selectRoomtyype({required RoomType releast}) async {
    roomType = releast;
    notifyListeners();
  }

  Future selectpropertyType({required PropertyType property}) async {
    propertyType = property;
    notifyListeners();
  }

  Future selectemirate({required Emirate emerate}) async {
    emirate = emerate;
    notifyListeners();
  }

  // Future selectemirateHousehold({required Emirate emerate}) async {
  //   emiratehousehold = emerate;
  //   notifyListeners();
  // }

  Future selectlocalities({required Locality emerate}) async {
    localities = emerate;
    notifyListeners();
  }

  selectnoOfCheque({required String emerate}) async {
    noCheque = emerate;
    notifyListeners();
  }

  Future selecthouseholdAge({required Age releast}) async {
    age = releast;
    notifyListeners();
  }

  Future currentRealStateChange({required RangeValues vlaue}) async {
    currentRealState = vlaue;
    notifyListeners();
  }

  Future selecthouseholdcondition({required Condition releast}) async {
    condition = releast;
    notifyListeners();
  }

  selectavailableformDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      datePick.text = formattedDate;
    }
    //  else {
    //   context.pop();
    // }
  }

  Future saveListingRealState() async {
    late bool log = false;
    isLoadingTrue();
    try {
      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // var userId = await preferences.getString('driverID');
      // print(nationality!.id.toString());
      var res = await HomeApiRepository().realState(
          category_id: '1',
          locality: localities != null ? localities!.id!.toString() : "",
          // price: currentRealState.start.toString(),
          emirates_id: emirate != null ? emirate!.id!.toString() : "",
          re_listing_type_id: isRentalSelected ? "1" : "2",
          property_type_id:
              propertyType != null ? propertyType!.id!.toString() : "",
          room_type_id: roomType != null ? roomType!.id.toString() : "",
          // no_of_cheque: noCheque ?? "",
          available_from: datePick.text,
          fromAmount: currentRealState.start.toString(),
          toAmount: currentRealState.end.toString()
          // nationality: nationality != null ? nationality!.id.toString() : ""
          );
      // print(res);
      if (res["status"] == "success") {
        // print("Error");
        // print(res["message"]);
        log = true;
        homeModel = SearchListingModel.fromJson(res);
        // ShowToast(msg: res["results"]["message"].toString() ?? "");
        // clearDataRealstate();
      } else if (res["status"] == 200) {
        homeModel = SearchListingModel.fromJson(res);
        // clearDataRealstate();
        datePick.text = '';
        notifyListeners();
        // ShowToast(msg: res["message"] ?? "");
        log = true;
      } else {
        // print(res);
        ShowToast(msg: res);
      }
    } catch (e) {
      print(e);
    }

    // print("title: ${title.text}");
    // print("descreptation: ${description.text}");
    // print("rental: ${rentalPrice.text}");
    // print("cheque: ${noCheque}");
    // print("type: ${type?.id}");
    // print("emirates: ${emirate?.id ?? ""}");
    // print("localties: ${localities?.id}");
    // print("property type: ${propertyType?.id}");
    // print("room type: ${roomType?.id}");
    // print("no of cheque: ${noCheque}");
    // print("available form: ${availableForm}");
    // print("nationality: ${nationality?.id}");
    // print("image: ${img?.path}");

    isLoadingFalse();
    notifyListeners();
    return log;
  }

  //houseshold

  Future selectprice({required PropertyType property}) async {
    propertyType = property;
    notifyListeners();
  }

  Future selectemirateHousehold({required Emirate emerate}) async {
    emiratehousehold = emerate;
    notifyListeners();
  }

  Future selectloocalityHousehold({required Locality emerate}) async {
    localitiesHouseHold = emerate;
    notifyListeners();
  }

  Future selecthouseholdtype({required HouseHold emerate}) async {
    household = emerate;
    notifyListeners();
  }

  selectSubtype({required HouseHoldSubType emerate}) async {
    householdsubtype = emerate;
    notifyListeners();
  }

  Future householdStateChange({required RangeValues vlaue}) async {
    currentHomeapp = vlaue;
    notifyListeners();
  }

  Future householdVivewmodel() async {
    bool log = false;
    isLoadingTrue();
    // print(localitiesHouseHold!.id!.toString());
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var userId = await preferences.getString('driverID');
      var res = await HomeApiRepository().houseHold(
          category_id: '2',
          // created_by: userId ?? "",
          locality: localitiesHouseHold != null
              ? localitiesHouseHold!.id!.toString()
              : "",
          // price: currentHomeapp.start.toString(),
          emirates_id:
              emiratehousehold != null ? emiratehousehold!.id!.toString() : "",
          household_type_id: household != null ? household!.id.toString() : "",
          household_sub_type_id:
              householdsubtype != null ? householdsubtype!.id.toString() : "",
          condition_id: condition != null ? condition!.id.toString() : "",
          appliance_age_id: age != null ? age!.id.toString() : "",
          fromAmount: currentHomeapp.start.toString(),
          toAmount: currentHomeapp.end.toString());
      print(res);
      if (res["status"] == 200) {
        // print("Error");
        // print(res["message"]);
        log = true;
        homeModel = SearchListingModel.fromJson(res);
        notifyListeners();

        // clearDataHouseHold();
        // ShowToast(msg: res["results"]["message"].toString() ?? "");
        // clearDataHouseHold();
      }
    } catch (e) {
      print(e);
    }
    isLoadingFalse();
    notifyListeners();
    return log;
  }

  clearDataRealstate() {
    localities = Locality();
    currentRealState = RangeValues(100, 20000);
    emirate = Emirate();
    isRentalSelected = true;
    propertyType = PropertyType();
    roomType = RoomType();
    noCheque = null;
    datePick.text = '';
    nationality = Nationality();
    notifyListeners();
  }

  clearDataHouseHold() {
    localities = null;
    currentHomeapp = RangeValues(100, 20000);
    emiratehousehold = null;
    nationality = null;
    household = null;
    householdsubtype = null;
    condition = null;
    age = null;
    notifyListeners();
  }

  Future profileViewmodel() async {
    late bool log = false;
    isLoadingTrue();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var email = await preferences.getString('email');
    var res =
        await HomeApiRepository().profile(email: email!); // id: userId ?? ""
    if (res["status"] == "success") {
      // loginModel = LoginModel.fromJson(res);
      // ShowToast(msg: res["message"] ?? "");
      profile = UserProfileModel.fromJson(res);
      log = true;
      notifyListeners();
    } else {
      // print(res);
      ShowToast(msg: res);
    }
    isLoadingFalse();
    notifyListeners();
    return log;
  }
}
