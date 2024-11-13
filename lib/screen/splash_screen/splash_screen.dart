import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/login/login_screen.dart';
import '../navigation/navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    // Start the animation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isAnimated = true;
      });
      Timer(Duration(seconds: 3), () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        var userId = await preferences.getString('driverID');
        if (userId != null) {
          context.pushReplacement('/home', extra: {'id': "0", 'sea': "home"});
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => NavigationScreen()));
        } else {
          context.pushReplacement('/login');
          //   // Navigator.push(
          //   //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              top: _isAnimated ? 0 : -height * 0.3,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset("assets/logo/002.png"),
                  ),
                  Expanded(
                      child: Container(
                          // width: 200, // the size you prefer
                          // height: 200,
                          transformAlignment: Alignment.center,
                          transform: Matrix4.rotationZ(
                            -3.18, // here
                          ),
                          child: Image.asset("assets/logo/003.png"))),
                ],
              )),
          // Bottom image with animation
          AnimatedPositioned(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              bottom: _isAnimated ? 0 : -height * 0.3,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  Expanded(child: Image.asset("assets/logo/003.png")),
                  Expanded(
                      child: Container(
                          // width: 200, // the size you prefer
                          // height: 200,
                          transformAlignment: Alignment.center,
                          transform: Matrix4.rotationY(3.14159),
                          child: Image.asset(
                            "assets/logo/001.png",
                            fit: BoxFit.fill,
                          ))),
                  // Expanded(child: Image.asset("assets/logo/006.png")),
                ],
              )),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            top: _isAnimated ? height * 0.2 : height * 0.18,
            left: 30,
            child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/logo/006.png", fit: BoxFit.fill)),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            bottom: _isAnimated ? height * 0.2 : height * 0.18,
            // bottom: 150,
            right: 30,
            child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/logo/006.png", fit: BoxFit.fill)),
          ),
          Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("assets/logo/7em_hom-logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
