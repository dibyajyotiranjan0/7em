import 'package:em/screen/auth/forgetPassword/forget_password_screen.dart';
import 'package:em/static/textfield_controller/textfieldValidator.dart';
import 'package:em/viewmodel/auth/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../static/colors.dart';
import '../../navigation/navigation_screen.dart';
import '../signup/signup_screen.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  bool _isDropdownVisible = false;

  List<String> emailOptions = [
    'user1@example.com',
    'user2@example.com',
    'user3@example.com'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/7em-logo.png", // Replace with your logo asset
                  height: 120,
                ),
                Expanded(
                  // flex: 2,
                  child: Consumer<AuthViewModel>(builder: (context, login, _) {
                    return Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(height: 50), // Add some space at the top
                          // Logo

                          // SizedBox(height: 20),
                          // "Place Ads - Buy Cheap" Text
                          Text(
                            'PLACE ADS / BUY CHEAP',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 30),
                          // Email Input
                          TextFormField(
                            controller: login.email,
                            validator: (value) =>
                                Validator().validateEmail(value),
                            decoration: InputDecoration(
                              labelText: 'Email Address',
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
                                    color: Colo.greycolorCode, width: 1.5),
                                //  BorderSide(
                                //   color: Colo.buttonPrimary,
                                //   width: 2.0,
                                // ),
                              ),
                              errorMaxLines:
                                  1, // Set the maximum lines for error message
                              errorStyle: TextStyle(height: 0.8),
                            ),
                            onTap: () {
                              // setState(() {
                              //   _showCustomDialog();
                              // });
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: login.password,
                            obscureText: !login.visible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  login.visible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  login.passwordVisible(); // Toggle visibility
                                },
                              ),
                              labelText: 'Password',
                              labelStyle: Theme.of(context).textTheme.bodySmall,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colo.buttonPrimary, width: 1.5),
                              ),
                              floatingLabelStyle: TextStyle(
                                  color: Colo.buttonPrimary,
                                  fontWeight: FontWeight.bold),
                              fillColor: Colors.white,
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colo.buttonPrimary, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colo.buttonPrimary, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colo.greycolorCode, width: 1.5),
                                // borderSide: BorderSide(
                                //   color: Colo.buttonPrimary,
                                //   width: 2.0,
                                // ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Log In Button
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: login.isloading
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
                                      if (formkey.currentState!.validate()) {
                                        login.loginviewmodel().then((v) {
                                          if (v) {
                                            context.pushReplacement('/home',
                                                extra: {'id': "0"});
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             NavigationScreen()));
                                          }
                                        });
                                      }
                                    },
                                    child: Text(
                                      'Log In',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 30),
                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                context.push('/forgetPassword');
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ForgetPassword()));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ), // Add some spacing before the bottom text
                          // Create a new account
                          // Add space at the bottom
                        ],
                      ),
                    );
                  }),
                ),
                TextButton(
                  onPressed: () {
                    context.push('/signup');
                    // Navigator.ush(context,
                    //     MaterialPageRoute(builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    'Create a new account now?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
