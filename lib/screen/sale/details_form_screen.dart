import 'package:em/screen/sale/payment_screen.dart';
import 'package:em/screen/sale/upload_image_screen.dart';
import 'package:em/static/appbar_widget.dart';
import 'package:em/viewmodel/sale/sale_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../model/master/emirates_modoel.dart';
import '../../model/master/getlocaities-model.dart';
import '../../model/master/nationality_moodel.dart';
import '../../model/master/propertytype-model.dart';
import '../../model/master/relisting_model.dart';
import '../../model/master/roomType-model.dart';
import '../../static/colors.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../viewmodel/master/all_master_viewmodel.dart';

class DetailsFormScreen extends StatefulWidget {
  @override
  State<DetailsFormScreen> createState() => _DetailsFormScreenState();
}

class _DetailsFormScreenState extends State<DetailsFormScreen>
    with AutomaticKeepAliveClientMixin<DetailsFormScreen> {
  @override
  bool get wantKeepAlive => true;
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Provider.of<SaleViewModel>(context, listen: false).nullctlocalities();
      await Provider.of<MasterViewModel>(context, listen: false).allMaster();
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
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Add your Listing for Real Estate',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            // fontFamily: "RedHatDisplay-Light",
                            fontSize: 18,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (v) => v!.isEmpty ? "Enter Title" : null,
                      controller: submitForm.title,
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
                      controller: submitForm.description,
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
                    DropdownButtonFormField2<ReListing>(
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
                            borderSide: BorderSide(
                                color: Colo.greycolorCode, width: 1)),
                      ),
                      items: form.relistingsModel?.results?.reListings!
                          .map((ReListing value) {
                        return DropdownMenuItem<ReListing>(
                          value: value,
                          child: Text(value.listingType ?? ""),
                        );
                      }).toList(),
                      onChanged: (ReListing? newValue) {
                        submitForm.selectType(releast: newValue!);
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
                      onChanged: (Emirate? newValue) async {
                        if (newValue != null) {
                          await form.getlocalityViewmodel(
                              id: newValue!.id.toString());
                          submitForm.selectemirate(emerate: newValue!);
                        }
                      },
                      value: form.emiratemodel?.results?.emirates
                                  ?.contains(submitForm.selectedEmirate) ==
                              true
                          ? submitForm.selectedEmirate
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
                        submitForm.selectlocalities(emerate: newValue!);
                      },
                      value: form.getlocalities?.results?.localities
                                  ?.contains(submitForm.selectedLocalities) ==
                              true
                          ? submitForm.selectedLocalities
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
                        submitForm.selectpropertyType(property: newValue!);
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
                        submitForm.selectRoomtyype(releast: newValue!);
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
                      controller: submitForm.rentalPrice,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.greycolorCode, width: 1),
                          //  BorderSide(
                          //   color: Colo.buttonPrimary,
                          //   width: 2.0,
                          // ),
                        ),
                        labelText: 'Rental/Sale price',
                        // hintText: 'Rental/Sale price',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),

                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colo.greycolorCode)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    // DropdownButtonFormField2<String>(
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'Please select a type';
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(
                    //     floatingLabelBehavior: FloatingLabelBehavior.always,
                    //     labelText: 'No Of Cheques Allowed',
                    //     hintText: 'No Of Cheques Allowed',
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
                    //     submitForm.selectnoOfCheque(emerate: newValue!);
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
                      controller: submitForm.datePick,
                      readOnly: true,
                      onTap: () => submitForm.selectavailableformDate(context),
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
                    SizedBox(height: 20),
                    // DropdownButtonFormField2<Nationality>(
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'Please select a type';
                    //     }
                    //     return null;
                    //   },
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
                    //     submitForm.selectnatinality(releast: newValue!);
                    //   },
                    // ),
                    // SizedBox(height: 20),
                    InkWell(
                      onTap: () => submitForm.insertFituredImage(context, "r"),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 150,
                        child: Center(
                          child: submitForm.realstateImages[4] != null
                              ? Image.file(
                                  submitForm.realstateImages[4]!,
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
                            if (formkey.currentState!.validate()) {
                              context.push('/sellScreen/addmoreImage',
                                  extra: {'img': 'r', 'id': "1"});
                            }
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
                                if (formkey.currentState!.validate()) {
                                  // submitForm.saveListing().then((v) {
                                  //   if (v) {
                                  // context.push('/sellScreen',
                                  //     extra: {'id': "1"});
                                  context.push('/sellScreen/packageSelection',
                                      extra: {'id': "1", 'sale': "r"});
                                  //   }
                                  // });
                                }
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
