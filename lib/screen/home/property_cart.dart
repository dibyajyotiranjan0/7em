import 'package:em/static/aapp_url-endpoint.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyCard extends StatelessWidget {
  String? room;
  String? price;
  String? currency;
  String? description;
  String? image;
  String? show;
  String? categoryId;
  String? city;
  String? area;
  String? type;
  String? propertyType;
  String? houseType;
  String? housesubType;
  PropertyCard(
      {required this.room,
      required this.price,
      this.currency,
      required this.description,
      this.show,
      this.image,
      required this.categoryId,
      required this.city,
      required this.area,
      this.type,
      this.propertyType,
      this.houseType,
      this.housesubType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]
          // elevation: 4,
          ),
      child: categoryId == "1"
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: image != null || image == ""
                        ? Image.network('${AppUrl.imageUrl}${image}',
                            fit: BoxFit.fill, height: 60, width: 60)
                        : Image.network('${AppUrl.noImageUrl}',
                            fit: BoxFit.fill, height: 60, width: 60),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(currency ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.green)),
                            SizedBox(
                              width: 5,
                            ),
                            Text(price ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        // fontFamily: "RedHatDisplay-Light",
                                        fontSize: 16,
                                        color: Colors.green)),
                          ],
                        ),
                        // Text(
                        //   description ?? "",
                        //   style: Theme.of(context).textTheme.bodySmall,
                        //   maxLines: 2,
                        // ),
                        // show == null
                        //     ? SizedBox()
                        //     : SizedBox(
                        //         height: 35,
                        //         child: ElevatedButton(
                        //             onPressed: () {},
                        //             style: ElevatedButton.styleFrom(
                        //               // textStyle: TextStyle(color: Colors.white, fontSize: 16),
                        //               backgroundColor: Colors.amber,
                        //               shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //               // padding: EdgeInsets.zero,
                        //               minimumSize: Size(0, 30),
                        //             ),
                        //             child: Text(
                        //               show ?? "",
                        //               style: TextStyle(
                        //                   color: Colors.white, fontSize: 18),
                        //             )),
                        //       )
                        Text(
                          "${area ?? ""}, ${city ?? ""}",
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${type ?? ""}",
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${propertyType ?? ""}",
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  show == null
                      ? SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(left: 8, top: 16),
                          child: Transform.translate(
                            offset: Offset(0, -20),
                            child: Text(
                              show ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: show == "Active"
                                          ? Colors.green
                                          : Colors.red),
                            ),
                            // child: Icon(
                            //   Icons.favorite_border,
                            //   size: 30,
                            // )
                          ),
                        ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: image != null || image == ""
                          ? Image.network('${AppUrl.imageUrl}${image}',
                              fit: BoxFit.fill, height: 60, width: 60)
                          : Image.network('${AppUrl.noImageUrl}',
                              fit: BoxFit.fill, height: 60, width: 60)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(currency ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.green)),
                            SizedBox(
                              width: 5,
                            ),
                            Text(price ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        // fontFamily: "RedHatDisplay-Light",
                                        fontSize: 16,
                                        color: Colors.green)),
                          ],
                        ),
                        // Text(
                        //   description ?? "",
                        //   style: Theme.of(context).textTheme.bodySmall,
                        //   maxLines: 2,
                        // ),
                        // show == null
                        //     ? SizedBox()
                        //     : SizedBox(
                        //         height: 35,
                        //         child: ElevatedButton(
                        //             onPressed: () {},
                        //             style: ElevatedButton.styleFrom(
                        //               // textStyle: TextStyle(color: Colors.white, fontSize: 16),
                        //               backgroundColor: Colors.amber,
                        //               shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //               // padding: EdgeInsets.zero,
                        //               minimumSize: Size(0, 30),
                        //             ),
                        //             child: Text(
                        //               show ?? "",
                        //               style: TextStyle(
                        //                   color: Colors.white, fontSize: 18),
                        //             )),
                        //       )
                        Text(
                          "${area ?? ""}, ${city ?? ""}",
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${houseType ?? ""}",
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${housesubType ?? ""}",
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  show == null
                      ? SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(left: 8, top: 16),
                          child: Transform.translate(
                            offset: Offset(0, -20),
                            child: Text(
                              show ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: show == "Active"
                                          ? Colors.green
                                          : Colors.red),
                            ),
                            // child: Icon(
                            //   Icons.favorite_border,
                            //   size: 30,
                            // )
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
