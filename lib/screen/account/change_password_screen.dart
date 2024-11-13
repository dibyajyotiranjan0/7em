import 'package:em/screen/auth/forgetPassword/verify_otp_screen.dart';
import 'package:em/screen/auth/login/login_screen.dart';
import 'package:em/static/appbar_widget.dart';
import 'package:em/static/colors.dart';
import 'package:em/static/flutter_toast_message/toast_messge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/auth/login_viewmodel.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Consumer<AuthViewModel>(builder: (context, login, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50), // Add some space at the top
                    // Logo
                    // Image.asset(
                    //   "assets/logo/7em-logo.png", // Replace with your logo asset
                    //   height: 100,
                    // ),
                    // SizedBox(height: 20),
                    // "Place Ads - Buy Cheap" Text
                    // Text(
                    //   'PLACE ADS - BUY CHEAP',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.red,
                    //   ),
                    // ),
                    // SizedBox(height: 30),
                    // Email Input
                    // Password Input
                    Text('Change Your Password',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 18)),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: login.newpasswordlog,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                        floatingLabelStyle: TextStyle(
                            color: Colo.buttonPrimary,
                            fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.buttonPrimary, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   color: Colo.buttonPrimary,
                            //   width: 2.0,
                            // ),
                            ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: login.retypenewPassloog,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                        floatingLabelStyle: TextStyle(
                            color: Colo.buttonPrimary,
                            fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colo.buttonPrimary, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   color: Colo.buttonPrimary,
                            //   width: 2.0,
                            // ),
                            ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Log In Button
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.transparent)),
                          backgroundColor: Colo.buttonPrimary,
                          // padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          if (login.newpassword.text ==
                              login.retypenewPass.text) {
                            login.changePasswordlog();
                          } else {
                            ShowToast(msg: "Password Not Match");
                          }
                        },
                        child: Text(
                          'Change',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Forgot Password
                    // Add some spacing before the bottom text
                    // Create a new account
                    // Add space at the bottom
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
