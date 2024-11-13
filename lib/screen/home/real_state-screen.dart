import 'package:em/model/master/emirates_modoel.dart';
import 'package:em/model/master/getlocaities-model.dart';
import 'package:em/viewmodel/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/master/listings_model.dart';
import '../../model/master/nationality_moodel.dart';
import '../../model/master/propertytype-model.dart';
import '../../model/master/roomType-model.dart';
import '../../static/appbar_widget.dart';
import '../../static/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:go_router/go_router.dart';
import '../../static/flutter_toast_message/toast_messge.dart';
import '../../viewmodel/master/all_master_viewmodel.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with AutomaticKeepAliveClientMixin<FilterScreen> {
  @override
  bool get wantKeepAlive => true;
  String selectedCity = "Emirate";
  String selectedLocality = "Locality 1";
  String selectedPropertyType = "Property Type";
  String selectedRooms = "Rooms";
  String selectedCheques = "No. of Cheques Allowed";
  String selectedAvailableFrom = "Available From";
  String selectedNationality = "Preferred Nationality";
  final homeformkey = GlobalKey<FormState>();

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
      appBar: appBar(back: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Consumer<MasterViewModel>(builder: (context, form, _) {
            return Consumer<HomeViewModel>(builder: (context, home, _) {
              return Form(
                key: homeformkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          'Improve your search for Real Estate Listings using filter',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // setState(() {
                              //   home.isRentalSelected = true;
                              // });
                              home.selectType(true);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: home.isRentalSelected
                                  ? Colo.buttonPrimary
                                  : Colors.white,
                              foregroundColor: home.isRentalSelected
                                  ? Colors.white
                                  : Colo.buttonPrimary,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colo.buttonPrimary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Rental'),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // setState(() {
                              //   home.isRentalSelected = false;
                              // });
                              home.selectType(false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: home.isRentalSelected
                                  ? Colors.white
                                  : Colo.buttonPrimary,
                              foregroundColor: home.isRentalSelected
                                  ? Colo.buttonPrimary
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colo.buttonPrimary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Sale'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField2<Emirate>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      // buttonStyleData: const ButtonStyleData(
                      //   padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      // ),
                      // iconStyleData: const IconStyleData(
                      //   icon: Icon(
                      //     Icons.arrow_drop_down,
                      //     color: Colors.white,
                      //   ),
                      //   iconSize: 24,
                      // ),
                      // alignment: Alignment.centerLeft,

                      // menuItemStyleData: const MenuItemStyleData(
                      //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      // ),
                      // // buttonStyleData:
                      // //     ButtonStyleData(padding: EdgeInsets.zero),
                      // dropdownStyleData: DropdownStyleData(
                      //   // padding: EdgeInsets.zero,
                      //   // offset: const Offset(0, -50),
                      //   decoration: BoxDecoration(
                      //     // borderRadius: BorderRadius.circular(30),
                      //     color: Colors.white,
                      //   ),
                      // ),
                      // selectedItemBuilder: (context) {
                      //   return form.emiratemodel?.results?.emirates!
                      //       .map((Emirate value) {
                      //     return Text(value.emirateName ?? "");
                      //   }).toList();
                      // },

                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'City',
                        hintText: 'Select',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey),
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
                          // alignment: Alignment.center,
                          value: value,
                          child: Text(value.emirateName ?? ""),
                        );
                      }).toList(),
                      onChanged: (Emirate? newValue) {
                        if (newValue != null) {
                          form.getlocalityViewmodelHome(
                              id: newValue!.id.toString());
                          home.selectemirate(emerate: newValue!);
                        }
                      },
                      value: form.emiratemodel?.results?.emirates
                                  ?.contains(home.selectedEmirate) ==
                              true
                          ? home.selectedEmirate
                          : null,

                      dropdownStyleData: DropdownStyleData(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(-20, 0),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    DropdownButtonFormField2<Locality>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
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
                        home.selectlocalities(emerate: newValue!);
                      },
                      value: form.getlocalitiesHome?.results?.localities
                                  ?.contains(home.selectedLocalities) ==
                              true
                          ? home.selectedLocalities
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
                    DropdownButtonFormField2<PropertyType>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Property Type',
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
                      items: form.prpertyTypeModel?.results?.propertyType!
                          .map((PropertyType value) {
                        return DropdownMenuItem<PropertyType>(
                          value: value,
                          child: Text(value.propertyType ?? ""),
                        );
                      }).toList(),
                      onChanged: (PropertyType? newValue) {
                        home.selectpropertyType(property: newValue!);
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
                    DropdownButtonFormField2<RoomType>(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a type';
                        }
                        return null;
                      },
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Room Type',
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
                      items: form.roomTpemodel?.results?.roomTypes!
                          .map((RoomType value) {
                        return DropdownMenuItem<RoomType>(
                          value: value,
                          child: Text(value.roomType ?? ""),
                        );
                      }).toList(),
                      onChanged: (RoomType? newValue) {
                        home.selectRoomtyype(releast: newValue!);
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
                              text: "${home.currentRealState.start.toInt()}",
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
                              text: "${home.currentRealState.end.toInt()}",
                              style: Theme.of(context).textTheme.bodySmall)
                        ])),
                      ],
                    ),

                    RangeSlider(
                      values: home.currentRealState,
                      max: 50000000,
                      divisions: 100000,
                      labels: RangeLabels(
                        home.currentRealState.start.round().toString(),
                        home.currentRealState.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        home.currentRealStateChange(vlaue: values);
                        // setState(() {
                        //   home.currentRealState = values;
                        //   print(home.currentRealState);
                        // });
                      },
                    ),
                    SizedBox(height: 10),
                    // DropdownButtonFormField2<String>(
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'Please select a type';
                    //     }
                    //     return null;
                    //   },
                    //   menuItemStyleData: const MenuItemStyleData(
                    //     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    //   ),
                    //   decoration: InputDecoration(
                    //     floatingLabelBehavior: FloatingLabelBehavior.always,
                    //     labelText: 'No Of Cheques Allowed',
                    //     hintText: 'Select',
                    //     hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    //     contentPadding:
                    //         EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    //     alignLabelWithHint: true,
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(color: Colo.greycolorCode, width: 1),
                    //       //  BorderSide(
                    //       //   color: Colo.buttonPrimary,
                    //       //   width: 2.0,
                    //       // ),
                    //     ),
                    //     border: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colo.greycolorCode)),
                    //   ),
                    //   items: <String>['1', '2', '3'].map((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    //   onChanged: (String? newValue) {
                    //     home.selectnoOfCheque(emerate: newValue!);
                    //   },
                    // ),
                    // SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Select Date';
                        }
                        return null;
                      },
                      controller: home.datePick,
                      readOnly: true,
                      onTap: () => home.selectavailableformDate(context),
                      //  menuItemStyleData: const MenuItemStyleData(
                      //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      // ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Available From',
                        hintText: 'Date',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colo.greycolorCode)),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    SizedBox(height: 10),
                    // DropdownButtonFormField2<Nationality>(
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'Please select a type';
                    //     }
                    //     return null;
                    //   },
                    //   menuItemStyleData: const MenuItemStyleData(
                    //     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    //   ),
                    //   decoration: InputDecoration(
                    //     floatingLabelBehavior: FloatingLabelBehavior.always,
                    //     labelText: 'Preferred Nationality',
                    //     hintText: 'Select',
                    //     hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    //     contentPadding:
                    //         EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(color: Colo.greycolorCode, width: 1),
                    //       //  BorderSide(
                    //       //   color: Colo.buttonPrimary,
                    //       //   width: 2.0,
                    //       // ),
                    //     ),
                    //     border: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colo.greycolorCode)),
                    //   ),
                    //   items: form.nationalityModel?.results?.nationalities!
                    //       .map((Nationality value) {
                    //     return DropdownMenuItem<Nationality>(
                    //       value: value,
                    //       child: Text(value.nationality ?? ""),
                    //     );
                    //   }).toList(),
                    //   onChanged: (Nationality? newValue) {
                    //     home.selectnatinality(releast: newValue!);
                    //   },
                    // ),
                    // SizedBox(height: 20),
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
                                  // home.saveListingRealState();
                                  // if (homeformkey.currentState!.validate()) {
                                  //   ShowToast(
                                  //       msg: " Listing successfully submitted");
                                  home.saveListingRealState().then((v) {
                                    if (v) {
                                      context.pushReplacement('/home',
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
                                      .copyWith(
                                          // fontFamily: "RedHatDisplay-Light",
                                          color: Colors.white),
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

  Widget _buildDropdown(String label, String value, model) {
    return DropdownButtonFormField2<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colo.greycolorCode)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colo.greycolorCode, width: 1),
          //  BorderSide(
          //   color: Colo.buttonPrimary,
          //   width: 2.0,
          // ),
        ),
      ),
      value: value,
      items: [value]
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (val) {},
    );
  }
}
