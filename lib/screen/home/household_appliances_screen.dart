import 'package:em/model/master/emirates_modoel.dart';
import 'package:em/model/master/getlocaities-model.dart';
import 'package:em/model/master/household_model.dart';
import 'package:em/static/flutter_toast_message/toast_messge.dart';
import 'package:em/viewmodel/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/master/age-model.dart';
import '../../model/master/conditions_model.dart';
import '../../model/master/listings_model.dart';
import '../../model/master/nationality_moodel.dart';
import '../../model/master/roomType-model.dart';
import '../../model/master/select_subtype_as_on_type.dart';
import '../../static/appbar_widget.dart';
import '../../static/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:go_router/go_router.dart';
import '../../viewmodel/master/all_master_viewmodel.dart';

class HouseholdAppliancesScreen extends StatefulWidget {
  @override
  _HouseholdAppliancesScreenState createState() =>
      _HouseholdAppliancesScreenState();
}

class _HouseholdAppliancesScreenState extends State<HouseholdAppliancesScreen>
    with AutomaticKeepAliveClientMixin<HouseholdAppliancesScreen> {
  @override
  bool get wantKeepAlive => true;
  // RangeValues home.currentHomeapp = const RangeValues(10, 40);
  // String selectedCity = "Emirate";
  // String selectedLocality = "Locality 1";
  // String selectedPropertyType = "Property Type";
  // String selectedRooms = "Rooms";
  // String selectedCheques = "No. of Cheques Allowed";
  // String selectedAvailableFrom = "Available From";
  // String selectedNationality = "Preferred Nationality";
  final houseformkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MasterViewModel>(context, listen: false).allMaster();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBar(back: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Consumer<MasterViewModel>(builder: (contextt, form, _) {
            return Consumer<HomeViewModel>(builder: (contex, home, _) {
              return Form(
                key: houseformkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Improve your search for Household Listings using filter',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField2<Emirate>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'City',
                        hintText: 'Select',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colo.greycolorCode)),
                      ),
                      items: form.emiratemodel?.results?.emirates!
                          .map((Emirate value) {
                        return DropdownMenuItem<Emirate>(
                          value: value,
                          child: Text(value.emirateName ?? ""),
                        );
                      }).toList(),
                      onChanged: (Emirate? newValue) {
                        form.getlocalityViewmodelHome(
                            id: newValue!.id.toString());
                        // home.selectemirateHousehold(emerate: newValue!);
                        home.selectemirateHousehold(emerate: newValue!);
                      },
                      value: form.emiratemodel?.results?.emirates
                                  ?.contains(home.selectedEmirateHouse) ==
                              true
                          ? home.selectedEmirateHouse
                          : null,
                      dropdownStyleData: DropdownStyleData(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, 0),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField2<Locality>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Area/Locality',
                        hintText: 'Select',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colo.greycolorCode)),
                      ),
                      items: form.getlocalitiesHome?.results?.localities!
                          .map((Locality value) {
                        return DropdownMenuItem<Locality>(
                          value: value,
                          child: Text(value.localityName ?? ""),
                        );
                      }).toList(),
                      onChanged: (Locality? newValue) {
                        home.selectloocalityHousehold(emerate: newValue!);
                      },
                      value: form.getlocalitiesHome?.results?.localities
                                  ?.contains(home.selectedLocalitiesHouse) ==
                              true
                          ? home.selectedLocalitiesHouse
                          : null,
                      dropdownStyleData: DropdownStyleData(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, 0),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField2<HouseHold>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Type',
                        hintText: 'Select',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colo.greycolorCode)),
                      ),
                      items: form.houseHoldModel?.results?.houseHolds!
                          .map((HouseHold value) {
                        return DropdownMenuItem<HouseHold>(
                          value: value,
                          child: Text(value.householdType ?? ""),
                        );
                      }).toList(),
                      onChanged: (HouseHold? newValue) {
                        form.findSubtypeBuType(id: newValue!.id.toString());
                        home.selecthouseholdtype(emerate: newValue!);
                      },
                      value: form.houseHoldModel?.results?.houseHolds
                                  ?.contains(home.selecthusehold) ==
                              true
                          ? home.selecthusehold
                          : null,
                      dropdownStyleData: DropdownStyleData(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, 0),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField2<HouseHoldSubType>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Sub Type',
                        hintText: 'Select',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colo.greycolorCode)),
                      ),
                      items: form
                          .houseHoldSubtypeModel?.results?.houseHoldSubType!
                          .map((HouseHoldSubType value) {
                        return DropdownMenuItem<HouseHoldSubType>(
                          value: value,
                          child: Text(value.subType ?? ""),
                        );
                      }).toList(),
                      onChanged: (HouseHoldSubType? newValue) {
                        home.selectSubtype(emerate: newValue!);
                      },
                      value: form.houseHoldSubtypeModel?.results
                                  ?.houseHoldSubType
                                  ?.contains(home.selecthouseholdSubtype) ==
                              true
                          ? home.selecthouseholdSubtype
                          : null,
                      dropdownStyleData: DropdownStyleData(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, 0),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "Price : ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                          TextSpan(
                              text: "${home.currentHomeapp.start.toInt()}",
                              style: Theme.of(context).textTheme.bodySmall)
                        ])),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "Price : ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                          TextSpan(
                              text: "${home.currentHomeapp.end.toInt()}",
                              style: Theme.of(context).textTheme.bodySmall)
                        ])),
                      ],
                    ),
                    RangeSlider(
                      values: home.currentHomeapp,
                      max: 100000,
                      divisions: 1000,
                      labels: RangeLabels(
                        home.currentHomeapp.start.round().toString(),
                        home.currentHomeapp.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        home.householdStateChange(vlaue: values);
                        // setState(() {
                        //   home.currentHomeapp = values;
                        //   print(home.currentHomeapp);
                        // });
                      },
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField2<Age>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Age',
                        hintText: 'Select',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        alignLabelWithHint: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colo.greycolorCode)),
                      ),
                      items: form.age?.results?.ages!.map((Age value) {
                        return DropdownMenuItem<Age>(
                          value: value,
                          child: Text(value.age ?? ""),
                        );
                      }).toList(),
                      onChanged: (Age? newValue) {
                        home.selecthouseholdAge(releast: newValue!);
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, 0),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField2<Condition>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Condition',
                        hintText: 'Select',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colo.greycolorCode)),
                      ),
                      items: form.conditions?.results?.conditions!
                          .map((Condition value) {
                        return DropdownMenuItem<Condition>(
                          value: value,
                          child: Text(value.conditionType ?? ""),
                        );
                      }).toList(),
                      onChanged: (Condition? newValue) {
                        home.selecthouseholdcondition(releast: newValue!);
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, 0),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    SizedBox(height: 24),
                    Center(
                      child: SizedBox(
                        height: 48,
                        width: double.maxFinite,
                        child: home.isloading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colo.buttonPrimary,
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  // Submit action
                                  // if (houseformkey.currentState!.validate()) {
                                  // ShowToast(
                                  //     msg: " Listing successfully submitted");
                                  home.householdVivewmodel().then((v) {
                                    if (v) {
                                      context.push('/home',
                                          extra: {'id': "0", 'sea': "Search"});
                                    }
                                  });

                                  // }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colo.buttonPrimary,
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: 80, vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colo.buttonPrimary),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Search',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              );
            });
          }),
        ),
      ),
    );
  }
}
