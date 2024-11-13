import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:em/static/colors.dart';
import 'package:em/viewmodel/sale/sale_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../static/appbar_widget.dart';

class UploadImageScreen extends StatelessWidget {
  String page;
  UploadImageScreen({required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(back: true),
      body: Column(
        children: [
          Text(
            "Include Some More Images to Sell Faster",
            style: TextStyle(
                fontFamily: "RedHatDisplay-Light",
                fontSize: 18,
                color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<SaleViewModel>(builder: (context, img, _) {
              return Column(
                children: [
                  GridView.builder(
                      padding: EdgeInsets.all(12),
                      shrinkWrap: true,
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // childAspectRatio: 3 / 2,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 15,
                          crossAxisCount: 2),
                      itemBuilder: (context, int) {
                        return InkWell(
                          onTap: () {
                            // print(img.househodimages[int]);

                            img.insertFituredImage(context, "$page${int + 1}");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => DetailsFormScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colo.buttonPrimary),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 150,
                            child: page == 'r'
                                ? img.realstateImages[int] != null
                                    ? Image.file(img.realstateImages[int]!)
                                    : Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Upload Image',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontSize: 18,
                                                  ),
                                            ),
                                            SizedBox(height: 10),
                                            Icon(
                                              Icons.file_upload_outlined,
                                              color: Colo.buttonPrimary,
                                              size: 40,
                                            ),
                                          ],
                                        ),
                                      )
                                : img.househodimages[int] != null
                                    ? Image.file(img.househodimages[int]!)
                                    : Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Upload Image',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(fontSize: 18),
                                            ),
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
                        );
                      }),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colo.buttonPrimary,
                        // padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colo.buttonPrimary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        "Back",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ))
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
