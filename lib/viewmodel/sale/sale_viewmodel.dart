import 'dart:io';
import 'package:em/model/master/select_subtype_as_on_type.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:em/repository/saleRepository/sale_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../model/master/age-model.dart';
import '../../model/master/conditions_model.dart';
import '../../model/master/emirates_modoel.dart';
import '../../model/master/getlocaities-model.dart';
import '../../model/master/household_model.dart';
// import '../../model/master/household_subtype-modoel.dart';
import '../../model/master/nationality_moodel.dart';
import '../../model/master/package_model.dart';
import '../../model/master/propertytype-model.dart';
import '../../model/master/relisting_model.dart';
import '../../model/master/roomType-model.dart';
import '../../static/flutter_toast_message/toast_messge.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

class SaleViewModel extends ChangeNotifier {
  bool isloading = false;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController rentalPrice = TextEditingController();
  TextEditingController datePick = TextEditingController();
  //  TextEditingController availableForm = TextEditingController();
  String? noCheque;
  ReListing? type;
  Emirate? emirate;
  PropertyType? propertyType;
  RoomType? roomType;
  Nationality? nationality;
  Locality? localities;
  Package? packageRealstate;
  final ImagePicker _picker = ImagePicker();
  DateTime? availableForm;
  File? img;
  File? img1;
  File? img2;
  File? img3;
  List<File?> realstateImages = List.generate(5, (index) => null);

  File? img4;
  //householdsale form submit
  TextEditingController houseRentaltitle = TextEditingController();
  TextEditingController houseRentaldescription = TextEditingController();
  TextEditingController houseRentalrentalPrice = TextEditingController();
  Emirate? houseRentalrentalemirate;
  Locality? houseRentalrentallocalities;
  HouseHold? houseRentalrentalhousehold;
  HouseHoldSubType? houseRentalrentalhouseholdsubtype;
  Package? packageHousehold;
  Age? age;
  Condition? houseRentalrentalconditionmodel;
  File? houseRentalrentalimg;
  // File? houseRentalrentalimg1;
  // File? houseRentalrentalimg2;
  // File? houseRentalrentalimg3;

  List<File?> househodimages = List.generate(5, (index) => null);
  Emirate? get selectedEmirate => emirate;
  Locality? get selectedLocalities => localities;
  Emirate? get selectedEmirateHouse => houseRentalrentalemirate;
  Locality? get selectedLocalitiesHouse => houseRentalrentallocalities;
  HouseHold? get selecthuseholdrental => houseRentalrentalhousehold;
  HouseHoldSubType? get selecthouseholdSubtyperental =>
      houseRentalrentalhouseholdsubtype;

  insertFituredImage(BuildContext context, String fileName) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Text("Choose the medium of your Image"),
            actions: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () {
                  _pickImage(ImageSource.gallery, fileName);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera, fileName);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _pickImage(ImageSource source, file) async {
    final pickedFile = await _picker.pickImage(
        source: source, maxWidth: 400, imageQuality: 45);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final imageSize = await imageFile.length();
      final extension = path.extension(imageFile.path).toLowerCase();
      if (extension != '.jpg' || extension != '.jpeg' || extension != '.png') {
        ShowToast(msg: "Image Only Support JPG,PNG, JPEG Extension");
        // &&

        //()
      } else {
        // Show an error message if the image is too large
        if (imageSize <= 1 * 1024 * 1024) {
          if (file == "r") {
            realstateImages[4] = File(pickedFile.path);
          } else if (file == "h") {
            househodimages[4] = File(pickedFile.path);
          } else if (file == "r1") {
            realstateImages[0] = File(pickedFile.path);
          } else if (file == "r2") {
            realstateImages[1] = File(pickedFile.path);
          } else if (file == "r3") {
            realstateImages[2] = File(pickedFile.path);
          } else if (file == "r4") {
            realstateImages[3] = File(pickedFile.path);
          } else if (file == "h1") {
            househodimages[0] = File(pickedFile.path);
          } else if (file == "h2") {
            househodimages[1] = File(pickedFile.path);
          } else if (file == "h3") {
            househodimages[2] = File(pickedFile.path);
          } else if (file == "h4") {
            househodimages[3] = File(pickedFile.path);
          }

          notifyListeners();
        } else {
          ShowToast(msg: "Image Only Support Less Than 1 MB");
        }
      }
    } else {
      ShowToast(msg: 'No image selected.');
    }
  }

//   Future<void> pickFutureimage(ImageSource source, String file) async {
//     final pickedFile = await _picker.pickImage(source: source);

//     if (pickedFile != null) {
//       if (file == "logo") {
//         img = File(pickedFile.path);
//       // } else if (file == "aadharF") {
//       //   frontimg = File(pickedFile.path);
//       // } else if (file == "aadharB") {
//       //   backimg = File(pickedFile.path);
//       // } else if (file == "cheque") {
//       //   cheque = File(pickedFile.path);
//       // } else if (file == "license") {
//       //   license_img = File(pickedFile.path);
//       } else {}

//       notifyListeners();
//     } else {
//       ShowToast(msg: 'No image selected.');
//     }
//   }
//    Future<void> pickFutureimage(ImageSource source, String file) async {
//     final pickedFile = await _picker.pickImage(source: source);

//     if (pickedFile != null) {
//       if (file == "logo") {
//         img = File(pickedFile.path);
//       // } else if (file == "aadharF") {
//       //   frontimg = File(pickedFile.path);
//       // } else if (file == "aadharB") {
//       //   backimg = File(pickedFile.path);
//       // } else if (file == "cheque") {
//       //   cheque = File(pickedFile.path);
//       // } else if (file == "license") {
//       //   license_img = File(pickedFile.path);
//       } else {}

//       notifyListeners();
//     } else {
//       ShowToast(msg: 'No image selected.');
//     }
//   }

  isLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  Future selectType({required ReListing releast}) async {
    type = releast;
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

  Future selectlocalities({required Locality emerate}) async {
    localities = emerate;
    notifyListeners();
  }

  Future nullctlocalities() async {
    emirate = null;
    localities = null;
    notifyListeners();
  }

  selectpackage({required Package emerate}) async {
    packageRealstate = emerate;
    notifyListeners();
  }

  selectnoOfCheque({required String emerate}) async {
    noCheque = emerate;
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
    //   Navigator.pop(context);
    // }
  }

  Future saveListing() async {
    List<dynamic>? _documents = [];

    late bool log = false;
    isLoadingTrue();
    if (realstateImages != null) {
      for (var i = 0; i < realstateImages.length; i++) {
        if (realstateImages[i] != null) {
          _documents.add(realstateImages[i]);
        }
      }
    }
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var userId = await preferences.getString('driverID');
      var res = await SaleRepository().realstateSale(
        created_by: userId ?? "",
        title: title.text,
        description: description.text,
        locality: localities!.id!.toString(),
        price: rentalPrice.text,
        emirates_id: emirate!.id!.toString(),
        re_listing_type_id: type!.id.toString() ?? "",
        property_type_id: propertyType!.id!.toString(),
        room_type_id: roomType!.id.toString(),
        // no_of_cheque: noCheque ?? "",
        available_from: datePick.text,
        category_id: "1",
        package_id: packageRealstate!.id.toString() ?? "",
        // images: img != null
        //     ? await MultipartFile.fromFile(img!.path,
        //         filename: img!.path.split('/').last)
        //     : "",
        images: _documents,
        // nationality: nationality!.id.toString()
      );
      // print(res);
      if (res["status"] == "success") {
        // print("Error");
        // print(res["message"]);
        log = true;
        clearRealstate();
        ShowToast(msg: res["results"]["message"].toString() ?? "");
      }
      //  else if (res["status"] == 200) {
      //   // loginModel = LoginModel.fromJson(res);
      //   // ShowToast(msg: res["message"] ?? "");
      //   log = true;
      // } else {
      //   // print(res);
      //   ShowToast(msg: res);
      // }
    } catch (e) {
      isLoadingFalse();
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
    // print("available form: ${datePick.text}");
    // print("nationality: ${nationality?.id}");
    // print("image: ${ realstateImages.a?.path}"); ..

    isLoadingFalse();
    return log;
  }

  //household formdata
  Future selecthouseholdemirates({required Emirate releast}) async {
    houseRentalrentalemirate = releast;
    notifyListeners();
  }

  Future selecthouseholdlocalities({required Locality releast}) async {
    houseRentalrentallocalities = releast;
    notifyListeners();
  }

  Future selecthouseholdtype({required HouseHold releast}) async {
    houseRentalrentalhousehold = releast;
    notifyListeners();
  }

  Future selecthouseholdsubtype({required HouseHoldSubType releast}) async {
    houseRentalrentalhouseholdsubtype = releast;
    notifyListeners();
  }

  Future selecthouseholdAge({required Age releast}) async {
    age = releast;
    notifyListeners();
  }

  Future selecthouseholdcondition({required Condition releast}) async {
    houseRentalrentalconditionmodel = releast;
    notifyListeners();
  }

  selectpackageHousehold({required Package emerate}) async {
    packageHousehold = emerate;
    notifyListeners();
  }

  Future saveListingHousehold() async {
    List<dynamic>? _documents = [];
    late bool log = false;
    isLoadingTrue();
    if (househodimages != null) {
      for (var i = 0; i < househodimages.length; i++) {
        if (househodimages[i] != null) {
          _documents.add(househodimages[i]);
        }
      }
    }
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var userId = await preferences.getString('driverID');
      var res = await SaleRepository().householdSale(
          created_by: userId ?? "",
          title: houseRentaltitle.text,
          description: houseRentaldescription.text,
          locality: houseRentalrentallocalities!.id.toString(),
          price: houseRentalrentalPrice.text,
          emirates_id: houseRentalrentalemirate!.id!.toString(),
          images: _documents,
          package_id: packageHousehold!.id.toString(),
          // images: houseRentalrentalimg != null
          //     ? await MultipartFile.fromFile(img!.path,
          //         filename: img!.path.split('/').last)
          //     : "",
          household_type_id: houseRentalrentalhousehold!.id.toString(),
          household_sub_type_id:
              houseRentalrentalhouseholdsubtype!.id.toString(),
          appliance_age_id: age!.id.toString(),
          condition_id: houseRentalrentalconditionmodel!.id.toString(),
          category_id: "2");
      // print(res);
      if (res["status"] == "success") {
        // print("Error");
        // print(res["message"]);
        log = true;
        clearHousehold();
        ShowToast(msg: res["results"]["message"].toString() ?? "");
      }
      //  else if (res["status"] == 200) {
      //   // loginModel = LoginModel.fromJson(res);
      //   // ShowToast(msg: res["message"] ?? "");
      //   log = true;
      // } else {
      //   // print(res);
      //   ShowToast(msg: res);
      // }
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
    return log;
  }

  clearRealstate() {
    title.text = '';
    description.text = '';
    localities = Locality();
    rentalPrice.text = '';
    // emirate = Emirate();
    type = ReListing();
    propertyType = PropertyType();
    roomType = RoomType();
    noCheque = null;
    datePick.text = '';
    img = null;
    nationality = Nationality();
    realstateImages = List.generate(5, (index) => null);
    notifyListeners();
  }

  clearHousehold() {
    houseRentaltitle.text = '';
    houseRentaldescription.text = '';
    houseRentalrentallocalities = Locality();
    houseRentalrentalPrice.text = '';
    // houseRentalrentalemirate = Emirate();
    houseRentalrentalimg = null;
    // houseRentalrentalhousehold = HouseHold();
    houseRentalrentalhouseholdsubtype = HouseHoldSubType();
    age = Age();
    houseRentalrentalconditionmodel = Condition();
    househodimages = List.generate(5, (index) => null);
    notifyListeners();
  }
}
