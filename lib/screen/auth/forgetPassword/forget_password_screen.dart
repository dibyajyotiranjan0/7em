import 'package:em/screen/auth/forgetPassword/verify_otp_screen.dart';
import 'package:em/screen/auth/login/login_screen.dart';
import 'package:em/static/colors.dart';
import 'package:em/static/textfield_controller/textfieldValidator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/auth/login_viewmodel.dart';
import '../signup/signup_screen.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo/7em-logo.png", // Replace with your logo asset
                height: 120,
              ),
              Consumer<AuthViewModel>(builder: (context, forget, _) {
                return Form(
                  // key: forget.formkeypass,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(height: 50), // Add some space at the top
                      // Logo

                      // SizedBox(height: 20),
                      // "Place Ads - Buy Cheap" Text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'PLACE ADS / BUY CHEAP',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colo.buttonPrimary,
                                    ),
                          ),
                          SizedBox(height: 30),
                          // Email Input
                          // Password Input
                          Text(
                            'Please Enter Your Registered \nEmail ID',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            validator: (value) =>
                                Validator().validateEmail(value),
                            controller: forget.ForgetpasEmail,
                            // obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Enter Email',
                              labelStyle: Theme.of(context).textTheme.bodySmall,
                              floatingLabelStyle: TextStyle(
                                  color: Colo.buttonPrimary,
                                  fontWeight: FontWeight.bold),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colo.buttonPrimary, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colo.buttonPrimary, width: 1),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colo.buttonPrimary, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colo.greycolorCode,
                                  // width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          // Log In Button
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: forget.isloading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colo.buttonPrimary,
                                    ),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: Colors.transparent)),
                                      backgroundColor: Colo.buttonPrimary,
                                      // padding: EdgeInsets.symmetric(vertical: 16),
                                    ),
                                    onPressed: () {
                                      if (forget
                                          .ForgetpasEmail.text.isNotEmpty) {
                                        forget.ForgetPasswordRequest()
                                            .then((v) {
                                          if (v) {
                                            context.push('/veryfypassword');
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             VerifyOtpScreen()));
                                          }
                                        });
                                      }
                                    },
                                    child: Text(
                                      'Send OTP',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 18,
                                              color: Colors.white),
                                    ),
                                  ),
                          ),
                        ],
                      ),

                      // Forgot Password
                      // Add some spacing before the bottom text
                      // Create a new account
                      // Add space at the bottom
                    ],
                  ),
                );
              }),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
