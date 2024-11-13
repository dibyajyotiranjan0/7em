import 'package:em/screen/home/home_screen.dart';
import 'package:em/static/aapp_url-endpoint.dart';
import 'package:em/viewmodel/myAds/myads_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../static/appbar_widget.dart';
import '../home/property_cart.dart';
import '../sale/sell_screen.dart';
import 'package:go_router/go_router.dart';

class MyAddscreen extends StatefulWidget {
  const MyAddscreen({super.key});

  @override
  State<MyAddscreen> createState() => _MyAddscreenState();
}

class _MyAddscreenState extends State<MyAddscreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<myAdsViewmodel>(context, listen: false).myAdsView();
    });
  }
  // @override
  // void initState() {
  //   super.initState();

  // }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(back: true),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Colors.red.shade500,

              controller: _tabController,
              labelColor: Colors.black,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black,

              // indicatorColor: Colors.blue,
              // indicatorWeight: 0,
              // indicatorPadding: EdgeInsets.only(top: 0.0),
              // indicator: BoxDecoration(
              //   border: Border(
              //     top: BorderSide(
              //       color: Colors.red.shade200, // Color of the indicator
              //       width: 4.0, // Height of the indicator
              //     ),
              //   ),
              // ),
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.only(bottom: 5),
              labelPadding: EdgeInsets.zero,
              tabs: [
                Tab(text: 'My Ads'),
                Tab(text: 'Favourities'),
              ], // Color of the unselected tabs
              indicatorSize: TabBarIndicatorSize
                  .tab, // Indicator size for the selected tab
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Consumer<myAdsViewmodel>(builder: (context, myAds, _) {
                  return myAds.myAdsModel == null
                      ? Center(child: CircularProgressIndicator())
                      : myAds.myAdsModel!.results!.listings!.length == 0
                          ? Center(
                              child: Text("No Listings added by you"),
                            )
                          : ListView.builder(
                              itemCount:
                                  myAds.myAdsModel?.results?.listings?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    context.push('/myadd/adsDetails', extra: {
                                      'myAds': myAds.myAdsModel!.results!
                                          .listings![index],
                                      'id': "2"
                                    });
                                  },
                                  child: PropertyCard(
                                      image: myAds.myAdsModel!.results!.listings![index].images!.length == 0
                                          ? null
                                          : "${myAds.myAdsModel!.results!.listings![index].images!.last.listingId}/${myAds.myAdsModel!.results!.listings![index].images!.last.image2}" ??
                                              "",
                                      room: myAds.myAdsModel!.results!
                                              .listings![index].title ??
                                          "",
                                      price: myAds.myAdsModel!.results!
                                          .listings![index].price
                                          .toString(),
                                      currency: myAds.myAdsModel!.results!
                                          .listings![index].currency,
                                      description: myAds.myAdsModel!.results!
                                          .listings![index].description,
                                      show: myAds.myAdsModel!.results!
                                          .listings![index].status,
                                      city: myAds.myAdsModel!.results!
                                          .listings![index].emirateName,
                                      area: myAds.myAdsModel!.results!.listings![index].localityName,
                                      housesubType: myAds.myAdsModel!.results!.listings![index].subType,
                                      houseType: myAds.myAdsModel!.results!.listings![index].householdType,
                                      type: myAds.myAdsModel!.results!.listings![index].reListingTypeName,
                                      categoryId: myAds.myAdsModel!.results!.listings![index].categoryId.toString(),
                                      propertyType: myAds.myAdsModel!.results!.listings![index].propertyType),
                                );
                              });
                }),
                SizedBox()
                // ListView.builder(
                //     itemCount: 12,
                //     itemBuilder: (context, index) {
                //       return PropertyCard(
                //         room: '2 BHK',
                //         price: '1000000',
                //         description:
                //             'Lorem Ipsum is placeholder text used in the publishing and design industries to fill a space and give an impression of how the final text will look. It’s often used to demonstrate the visual form of a document without relying on meaningful content.',
                //       );
                //     }),
                // Center(child: Text('Profile Page')),
                // Center(child: Text('Profile Page')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
