import 'package:em/screen/home/category_button.dart';
import 'package:em/screen/home/household_appliances_screen.dart';
import 'package:em/screen/home/product_details_screen.dart';
import 'package:em/screen/home/property_cart.dart';
import 'package:em/screen/home/real_state-screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../model/home_model.dart';
import '../../model/master/listings_model.dart';
import '../../static/appbar_widget.dart';
import '../../viewmodel/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class ShowAlladsSealler extends StatefulWidget {
  String adsID;
  String? name;
  ShowAlladsSealler({required this.name, required this.adsID});

  @override
  State<ShowAlladsSealler> createState() => _ShowAlladsSeallerState();
}

class _ShowAlladsSeallerState extends State<ShowAlladsSealler> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false)
          .showAlladsperticuralSailor(id: widget.adsID);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(back: true),
      body: Consumer<HomeViewModel>(builder: (context, puser, _) {
        return puser.showAllAdsPerticularSailer == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                        child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'All listings from ',
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: ' ${widget.name ?? ""}',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ]))),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(5),
                    itemCount: puser.showAllAdsPerticularSailer?.results
                        ?.listings?.length, // Example of 4 items
                    itemBuilder: (context, index) {
                      return puser.showAllAdsPerticularSailer!.results!
                                  .listings![index].status !=
                              "Active"
                          ? SizedBox()
                          : InkWell(
                              onTap: () {
                                context.push('/home/showpay/dt', extra: {
                                  'id': "0",
                                  'details': puser.showAllAdsPerticularSailer!
                                      .results!.listings![index]
                                });

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ProductDetailsScreen(
                                //               details: SearchListingModel()
                                //                   .results!
                                //                   .listings!
                                //                   .first,
                                //             )));
                              },
                              child: PropertyCard(
                                image: puser
                                            .showAllAdsPerticularSailer!
                                            .results!
                                            .listings![index]
                                            .images!
                                            .length !=
                                        0
                                    ? "${puser.showAllAdsPerticularSailer!.results!.listings![index].images?.last.listingId ?? ""}/${puser.showAllAdsPerticularSailer!.results!.listings![index].images?.last.image2 ?? ""}"
                                    : null,
                                room: puser.showAllAdsPerticularSailer!.results!
                                    .listings![index].title,
                                currency: puser.showAllAdsPerticularSailer!
                                    .results!.listings![index].currency,
                                price: puser.showAllAdsPerticularSailer!
                                    .results!.listings![index].price
                                    .toString(),
                                description: puser.showAllAdsPerticularSailer!
                                    .results!.listings![index].description,
                                categoryId: puser.showAllAdsPerticularSailer!
                                    .results!.listings![index].categoryId
                                    .toString(),
                                propertyType: puser.showAllAdsPerticularSailer!
                                    .results!.listings![index].propertyType,
                                city: puser.showAllAdsPerticularSailer!.results!
                                    .listings![index].emirateName,
                                area: puser.showAllAdsPerticularSailer!.results!
                                    .listings![index].localityName,
                                housesubType: puser.showAllAdsPerticularSailer!
                                    .results!.listings![index].subType,
                                houseType: puser.showAllAdsPerticularSailer!
                                    .results!.listings![index].householdType,
                                type: puser.showAllAdsPerticularSailer!.results!
                                    .listings![index].reListingTypeName,
                              ));
                    },
                  ),
                ],
              );
      }),
    );
  }
}
