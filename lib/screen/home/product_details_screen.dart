import 'package:em/model/home_model.dart';
import 'package:em/screen/home/showallads_seller.dart';
import 'package:em/static/aapp_url-endpoint.dart';
import 'package:em/static/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../static/appbar_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  Listing details;
  ProductDetailsScreen({required this.details});
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _currentIndex = 0;
  // final Crousa _controller = CarouselController();

  // final List<String> _images = [
  //   'assets/logo/home.jpeg',
  //   'assets/logo/hoe_2.png',
  //   'assets/logo/home_3.png',
  // ];

  void showcontactSeller(
      {required BuildContext context,
      required String name,
      required String phone,
      required String email}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Name: ', style: Theme.of(context).textTheme.bodyMedium),
                  Text('$name',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            // fontFamily: "RedHatDisplay-Light",
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                          )),
                ],
              ),
              SizedBox(height: 12.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Email: ',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text('$email',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            // fontFamily: "RedHatDisplay-Light",
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                          )),
                ],
              ),
              SizedBox(height: 12.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Phone: ',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text('$phone',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            // fontFamily: "RedHatDisplay-Light",
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                          )),
                ],
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.start,
          actions: [
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  // showcontactSeller(context);
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  //         shape: RoundedRectangleBorder(
                  //   side: BorderSide(color: Colors.red.shade900),
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                ),
                child: Text(
                  'Close',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        // fontFamily: "RedHatDisplay-Light",
                        color: Colors.white,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(back: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // The slider
                  widget.details.images!.length == 0
                      ? SizedBox()
                      : CarouselSlider(
                          items: widget.details.images!
                              .map((item) => Image.network(
                                  "${AppUrl.imageUrl}${item.listingId}/${item.image2 ?? ""}",
                                  fit: BoxFit.cover))
                              .toList(),
                          // carouselController: _controller,
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.3,

                            autoPlay: true,
                            enlargeCenterPage: false,
                            aspectRatio: 1,
                            viewportFraction: 1.0,
                            // aspectRatio: 16 / 9,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                        ),

                  // Dotted indicator (bottom center)
                  Positioned(
                    bottom: 0, // Adjust the vertical position
                    child: widget.details.images!.length == 0
                        ? SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.details.images!
                                .asMap()
                                .entries
                                .map((entry) {
                              return GestureDetector(
                                // onTap: () =>_currentIndex.animateToPage(entry.key),
                                child: Container(
                                  width: 12.0,
                                  height: 12.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentIndex == entry.key
                                        ? Colors.indigo
                                        : Colors.grey,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            widget.details.categoryId == 1
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text('${widget.details.title}',
                            style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${widget.details.currency ?? ""}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 18, color: Colors.green),
                              ),
                              TextSpan(text: ' '),
                              TextSpan(
                                  text: '${widget.details.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 18, color: Colors.green)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        buildDetailRow(
                            'City', '${widget.details.emirateName ?? ""}'),
                        buildDetailRow(
                            'Area', '${widget.details.localityName ?? ""}'),
                        buildDetailRow('Type',
                            '${widget.details.reListingTypeName ?? ""}'),
                        buildDetailRow('Property Type',
                            '${widget.details.propertyType ?? ""}'),
                        buildDetailRow(
                            'Room Type', '${widget.details.roomType ?? ""}'),
                        // buildDetailRow(
                        //     'Cheque', '${widget.details.noOfCheque ?? ""}'),
                        // buildDetailRow('Nationality',
                        //     '${widget.details.nationalityName ?? ""}'),
                        buildDetailRow('Available From',
                            '${DateFormat('dd-MM-yyyy').format(DateFormat("yyyy-MM-dd").parse((widget.details.availableFrom ?? "")))}'),
                        SizedBox(height: 5),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Description',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Divider(
                                height: 5,
                                color: Colors.black,
                                // thickness: 0.3,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('${widget.details.description}',
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              showcontactSeller(
                                  context: context,
                                  phone: widget.details.userMobile.toString() ??
                                      "",
                                  email: widget.details.userEmail ?? "",
                                  name: widget.details.userName ?? "");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              // padding: EdgeInsets.symmetric(vertical: 15),
                              //         shape: RoundedRectangleBorder(
                              //   side: BorderSide(color: Colors.red.shade900),
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                            ),
                            child: Text(
                              'Contact Seller',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    // fontFamily: "RedHatDisplay-Light",
                                    color: Colors.white,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              context.push('/home/showpay', extra: {
                                'id': "0",
                                'adsName': widget.details.userName.toString(),
                                'adsID': widget.details.createdBy.toString()
                              });
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ShowAlladsSealler()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              // padding: EdgeInsets.symmetric(
                              //   // vertical: MediaQuery.of(context).size.height *
                              //   //     0.01, // 2% of screen height
                              //   horizontal: MediaQuery.of(context).size.width *
                              //       0.05, // 5% of screen width
                              // ),
                              //         shape: RoundedRectangleBorder(
                              //   side: BorderSide(color: Colors.red.shade900),
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                            ),
                            child: Text(
                              'Show all ads from this seller',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    // fontFamily: "RedHatDisplay-Light",
                                    color: Colors.white,
                                    fontSize: 16,
                                    // fontSize: MediaQuery.of(context).size.width * 0.04,
                                    // fontWeight: FontWeight.bold
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text('${widget.details.title}',
                            style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${widget.details.currency ?? ""}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    // fontFamily: "RedHatDisplay-Light",
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                    // color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${widget.details.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    // fontFamily: "RedHatDisplay-Light",
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                    // color: Colors.green,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        buildDetailRow(
                            'City', '${widget.details.emirateName ?? ""}'),
                        buildDetailRow('Area/ Locality',
                            '${widget.details.localityName ?? ""}'),
                        buildDetailRow('Type',
                            '${widget.details.reListingTypeName ?? ""}'),
                        buildDetailRow(
                            'Type', '${widget.details.householdType ?? ""}'),
                        buildDetailRow(
                            'Sub Type', '${widget.details.subType ?? ""}'),
                        buildDetailRow('Age', '${widget.details.age ?? ""}'),
                        buildDetailRow('Condition',
                            '${widget.details.conditionType ?? ""}'),
                        SizedBox(height: 5),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Description',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Divider(
                                height: 5,
                                color: Colors.black,
                                // thickness: 0.3,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('${widget.details.description}',
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              showcontactSeller(
                                  context: context,
                                  phone: widget.details.userMobile.toString() ??
                                      "",
                                  email: widget.details.userEmail ?? "",
                                  name: widget.details.userName ?? "");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              // padding: EdgeInsets.symmetric(vertical: 15),
                              //         shape: RoundedRectangleBorder(
                              //   side: BorderSide(color: Colors.red.shade900),
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                            ),
                            child: Text(
                              'Contact Seller',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    // fontFamily: "RedHatDisplay-Light",
                                    color: Colors.white,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              context.push('/home/showpay', extra: {
                                'id': "0",
                                'adsID': widget.details.createdBy.toString(),
                                'adsName': widget.details.userName ?? ""
                              });
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ShowAlladsSealler()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              // padding: EdgeInsets.symmetric(
                              //   // vertical: MediaQuery.of(context).size.height *
                              //   //     0.01, // 2% of screen height
                              //   horizontal: MediaQuery.of(context).size.width *
                              //       0.05, // 5% of screen width
                              // ),
                              //         shape: RoundedRectangleBorder(
                              //   side: BorderSide(color: Colors.red.shade900),
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                            ),
                            child: Text(
                              'Show all ads from this seller',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    // fontFamily: "RedHatDisplay-Light",
                                    color: Colors.white,
                                    fontSize: 16,
                                    // fontSize: MediaQuery.of(context).size.width * 0.04,
                                    // fontWeight: FontWeight.bold
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text('$label : ', style: Theme.of(context).textTheme.bodyMedium),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
