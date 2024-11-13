import 'package:em/screen/home/category_button.dart';
import 'package:em/screen/home/home_widget.dart';
import 'package:em/screen/home/household_appliances_screen.dart';
import 'package:em/screen/home/product_details_screen.dart';
import 'package:em/screen/home/property_cart.dart';
import 'package:em/screen/home/real_state-screen.dart';
import 'package:em/viewmodel/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../model/home_model.dart';
import '../../static/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  String? sear;
  HomeScreen({this.sear});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: appBar(),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.white,
            // surfaceTintColor: Colors.white,
            // shadowColor: Colors.white,
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    context.push('/home/realstate', extra: {'id': "0"});
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FilterScreen()));
                  },
                  child: Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            12), // Adjust if you need rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Shadow color with opacity
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(
                                0, 0), // No offset for even shadow on all sides
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/logo/Real Estate.png",
                              width: 30,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Real Estate",
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    context.push('/home/household');
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => HouseholdAppliancesScreen()));
                  },
                  child: Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            12), // Adjust if you need rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Shadow color with opacity
                            // spreadRadius: 1,
                            blurRadius: 6,
                            // offset: Offset(
                            //     0, 0), // No offset for even shadow on all sides
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              "assets/logo/Household.png",
                              width: 30,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Household",
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),

          // Property Listings
          Expanded(
              child: HomeWidget(
            sea: sear,
          )),
        ],
      ),
    );
  }
}
