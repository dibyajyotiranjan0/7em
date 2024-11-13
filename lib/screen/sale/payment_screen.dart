import 'package:em/static/appbar_widget.dart';
import 'package:em/static/colors.dart';
import 'package:em/static/flutter_toast_message/toast_messge.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/home/home_viewmodel.dart';
import '../../viewmodel/master/all_master_viewmodel.dart';
import '../../viewmodel/sale/sale_viewmodel.dart';

class PackageSelectionScreen extends StatefulWidget {
  String page;
  PackageSelectionScreen({required this.page});
  @override
  _PackageSelectionScreenState createState() => _PackageSelectionScreenState();
}

class _PackageSelectionScreenState extends State<PackageSelectionScreen> {
  int? _selectedPackage = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(back: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Select Package To Show Your Listing',
                style: TextStyle(
                  fontFamily: "RedHatDisplay-Light",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Consumer<MasterViewModel>(builder: (context, master, _) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: master.packageModel?.results?.packages?.length,
                  itemBuilder: (context, intt) {
                    return RadioListTile(
                      value: intt,
                      groupValue: _selectedPackage,
                      title: Text(
                          '${master.packageModel?.results?.packages?[intt].packageName ?? ""} - ${master.packageModel?.results?.packages?[intt].amount ?? ""} ${master.packageModel?.results?.packages?[intt].currency ?? ""} - ${master.packageModel?.results?.packages?[intt].duration ?? ""} Days'),
                      onChanged: (int? value) {
                        if (master.packageModel?.results?.packages?[intt] !=
                            null) {
                          _selectedPackage = value!;
                          if (widget.page == "r") {
                            Provider.of<SaleViewModel>(context, listen: false)
                                .selectpackage(
                                    emerate: master.packageModel!.results!
                                        .packages![intt]);
                          } else {
                            Provider.of<SaleViewModel>(context, listen: false)
                                .selectpackageHousehold(
                                    emerate: master.packageModel!.results!
                                        .packages![intt]);
                          }
                        }
                        setState(() {});
                      },
                    );
                  });
            }),

            // RadioListTile(
            //   value: 2,
            //   groupValue: _selectedPackage,
            //   title: Text('Package 2 - 10 AED - 7 Days'),
            //   onChanged: (int? value) {
            //     setState(() {
            //       _selectedPackage = value!;
            //     });
            //   },
            // ),
            // RadioListTile(
            //   value: 3,
            //   groupValue: _selectedPackage,
            //   title: Text('Package 3 - 15 AED - 10 Days'),
            //   onChanged: (int? value) {
            //     setState(() {
            //       _selectedPackage = value!;
            //     });
            //   },
            // ),

            SizedBox(
              height: 10,
            ),
            Consumer<SaleViewModel>(builder: (context, submitForm, _) {
              return SizedBox(
                height: 48,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: submitForm.isloading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colo.buttonPrimary,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            // Handle submit action here
                            if (_selectedPackage != null &&
                                !submitForm.isloading) {
                              if (widget.page == "r") {
                                submitForm.saveListing().then((v) {
                                  if (v) {
                                    Provider.of<HomeViewModel>(context,
                                            listen: false)
                                        .homeViewmodel()
                                        .then((v) {
                                      context.pushReplacement('/sellScreen',
                                          extra: {'id': "1"});
                                    });
                                  }
                                });
                              } else {
                                submitForm.saveListingHousehold().then((v) {
                                  if (v) {
                                    Provider.of<HomeViewModel>(context,
                                            listen: false)
                                        .homeViewmodel()
                                        .then((v) {
                                      if (v) {
                                        context.pushReplacement('/sellScreen',
                                            extra: {'id': "1"});
                                      }
                                    });
                                  }
                                });
                              }
                            } else {
                              ShowToast(msg: "Select Package");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colo.buttonPrimary,
                            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colo.buttonPrimary),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontFamily: "RedHatDisplay-Light",
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
