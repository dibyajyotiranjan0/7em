import 'package:flutter/material.dart';

AppBar appBar({bool? back}) {
  return AppBar(
      // automaticallyImplyLeading: back ?? false,
      // backgroundColor: Colors.purple, // Matches the top bar color
      // elevation: 0,
      // toolbarHeight: 80,
      centerTitle: true,
      leadingWidth: 50,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          top: 4,
          bottom: 4,
        ),
        child: Image.asset(
          "assets/logo/7em-logo.png",
          height: 50,
          width: 50,
          // fit: BoxFit.fill,
        ),
      ));
}
