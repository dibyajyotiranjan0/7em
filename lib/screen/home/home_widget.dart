import 'package:em/screen/home/product_details_screen.dart';
import 'package:em/screen/home/property_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/home/home_viewmodel.dart';
import 'package:go_router/go_router.dart';

class HomeWidget extends StatefulWidget {
  String? sea;
  HomeWidget({this.sea, super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.sea != "Search") {
        Provider.of<HomeViewModel>(context, listen: false).homeViewmodel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return homeViewModel.homeModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () =>
                  Provider.of<HomeViewModel>(context, listen: false)
                      .homeViewmodel(),
              child: homeViewModel.homeModel!.results!.listings!
                      .any((map) => map.status == 'Active')
                  ? ListView.builder(
                      padding: EdgeInsets.all(5),
                      itemCount: homeViewModel.homeModel!.results!.listings!
                          .length, // Example of 4 items
                      itemBuilder: (context, index) {
                        return homeViewModel.homeModel!.results!
                                    .listings![index].status ==
                                "Active"
                            ? InkWell(
                                onTap: () {
                                  context.push('/home/details', extra: {
                                    'details': homeViewModel
                                        .homeModel!.results!.listings![index],
                                    'id': "0"
                                  });
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => ProductDetailsScreen(
                                  //             details: homeViewModel
                                  //                 .homeModel!.results!.listings![index])));
                                },
                                child: PropertyCard(
                                  image: homeViewModel
                                              .homeModel!
                                              .results!
                                              .listings![index]
                                              .images
                                              ?.length !=
                                          0
                                      ? "${homeViewModel.homeModel!.results!.listings![index].images?.last.listingId ?? ""}/${homeViewModel.homeModel!.results!.listings![index].images?.last.image2 ?? ""}"
                                      : null,
                                  room: homeViewModel.homeModel!.results!
                                          .listings![index].title ??
                                      "",
                                  currency: homeViewModel.homeModel!.results!
                                          .listings![index].currency ??
                                      "",
                                  price: homeViewModel.homeModel!.results!
                                      .listings![index].price
                                      .toString(),
                                  description: homeViewModel.homeModel!.results!
                                      .listings![index].description,
                                  city: homeViewModel.homeModel!.results!
                                      .listings![index].emirateName,
                                  area: homeViewModel.homeModel!.results!
                                      .listings![index].localityName,
                                  housesubType: homeViewModel.homeModel!
                                      .results!.listings![index].subType,
                                  houseType: homeViewModel.homeModel!.results!
                                      .listings![index].householdType,
                                  type: homeViewModel.homeModel!.results!
                                      .listings![index].reListingTypeName,
                                  propertyType: homeViewModel.homeModel!
                                      .results!.listings![index].propertyType,
                                  categoryId: homeViewModel.homeModel!.results!
                                      .listings![index].categoryId
                                      .toString(),
                                ))
                            : SizedBox();
                      },
                    )
                  : Center(
                      child: Text("No Listing"),
                    ),
            );
    });
  }
}
