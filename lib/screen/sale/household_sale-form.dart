import 'package:em/model/master/age-model.dart';
import 'package:em/model/master/conditions_model.dart';
// import 'package:em/model/master/household_subtype-modoel.dart';
import 'package:em/screen/sale/payment_screen.dart';
import 'package:em/screen/sale/upload_image_screen.dart';
import 'package:em/static/appbar_widget.dart';
import 'package:em/viewmodel/sale/sale_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../model/master/emirates_modoel.dart';
import '../../model/master/getlocaities-model.dart';
import '../../model/master/household_model.dart';
import '../../model/master/nationality_moodel.dart';
import '../../model/master/propertytype-model.dart';
import '../../model/master/relisting_model.dart';
import '../../model/master/roomType-model.dart';
import '../../model/master/select_subtype_as_on_type.dart';
import '../../static/colors.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../viewmodel/home/home_viewmodel.dart';
import '../../viewmodel/master/all_master_viewmodel.dart';

class householdFormScreen extends StatefulWidget {
  @override
  State<householdFormScreen> createState() => _householdFormScreenState();
}

class _householdFormScreenState extends State<householdFormScreen>
    with AutomaticKeepAliveClientMixin<householdFormScreen> {
  @override
  bool get wantKeepAlive => true;
  final householdFormkey = GlobalKey<FormState>();
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
      backgroundColor: Colors.white,
      appBar: appBar(back: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Consumer<MasterViewModel>(builder: (context, form, _) {
            return Consumer<SaleViewModel>(builder: (context, submitForm, _) {
              return Form(
                key: householdFormkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Add your Listing for Household',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (v) => v!.isEmpty ? "Enter Title" : null,
                      controller: submitForm.houseRentaltitle,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (v) => v!.isEmpty ? "Enter Description" : null,
                      controller: submitForm.houseRentaldescription,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
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
                        if (newValue != null) {
                          form.getlocalityViewmodel(
                              id: newValue!.id.toString());
                          submitForm.selecthouseholdemirates(releast: newValue);
                        }
                      },
                      value: form.emiratemodel?.results?.emirates
                                  ?.contains(submitForm.selectedEmirateHouse) ==
                              true
                          ? submitForm.selectedEmirateHouse
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
                      items: form.getlocalities?.results?.localities!
                          .map((Locality value) {
                        return DropdownMenuItem<Locality>(
                          value: value,
                          child: Text(value.localityName ?? ""),
                        );
                      }).toList(),
                      onChanged: (Locality? newValue) {
                        if (newValue != NullableIndexedWidgetBuilder) {
                          submitForm.selecthouseholdlocalities(
                              releast: newValue!);
                        }
                      },
                      value: form.getlocalities?.results?.localities?.contains(
                                  submitForm.selectedLocalitiesHouse) ==
                              true
                          ? submitForm.selectedLocalitiesHouse
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
                        if (newValue != null) {
                          form.findSubtypeBuTypeSale(
                              id: newValue!.id.toString());
                          submitForm.selecthouseholdtype(releast: newValue!);
                        }
                      },
                      value: form.houseHoldModel?.results?.houseHolds
                                  ?.contains(submitForm.selecthuseholdrental) ==
                              true
                          ? submitForm.selecthuseholdrental
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
                      items: form.selectSubtype?.results?.houseHoldSubType!
                          .map((HouseHoldSubType value) {
                        return DropdownMenuItem<HouseHoldSubType>(
                          value: value,
                          child: Text(value.subType ?? ""),
                        );
                      }).toList(),
                      onChanged: (HouseHoldSubType? newValue) {
                        submitForm.selecthouseholdsubtype(releast: newValue!);
                      },
                      value: form.selectSubtype?.results?.houseHoldSubType
                                  ?.contains(submitForm
                                      .selecthouseholdSubtyperental) ==
                              true
                          ? submitForm.selecthouseholdSubtyperental
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
                        submitForm.selecthouseholdAge(releast: newValue!);
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
                        // contentPadding: EdgeInsets.zero,
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
                        submitForm.selecthouseholdcondition(releast: newValue!);
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
                    TextFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Enter Price';
                        }
                        return null;
                      },
                      controller: submitForm.houseRentalrentalPrice,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        labelText: 'Price',
                        floatingLabelStyle:
                            TextStyle(fontSize: 14, color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colo.greycolorCode)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () => submitForm.insertFituredImage(context, "h"),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 150,
                        child: Center(
                          child: submitForm.househodimages[4] != null
                              ? Image.file(
                                  submitForm.househodimages[4]!,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Upload Featured Image',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    SizedBox(height: 10),
                                    Icon(
                                      Icons.file_upload_outlined,
                                      color: Colo.buttonPrimary,
                                      size: 40,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 200,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            context.push('/sellScreen/addmoreImage',
                                extra: {'img': 'h', 'id': "1"});
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            // padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              // side: BorderSide(color: Colo.buttonPrimary),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Add More Images',
                            style: TextStyle(
                                fontFamily: "RedHatDisplay-Light",
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 48,
                      width: double.maxFinite,
                      child: submitForm.isloading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colo.buttonPrimary,
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                if (householdFormkey.currentState!.validate()) {
                                  context.push('/sellScreen/packageSelection',
                                      extra: {'id': "1", 'sale': "h"});
                                }
                                // submitForm.clearHousehold();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colo.buttonPrimary,
                                // padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colo.buttonPrimary),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Proceed',
                                style: TextStyle(
                                    fontFamily: "RedHatDisplay-Light",
                                    color: Colors.white),
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
