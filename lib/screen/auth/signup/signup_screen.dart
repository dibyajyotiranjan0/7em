import 'package:em/static/colors.dart';
import 'package:em/static/flutter_toast_message/toast_messge.dart';
import 'package:em/static/textfield_controller/textfieldValidator.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/auth/login_viewmodel.dart';
import '../login/login_screen.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final formkeySignup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(
            "assets/logo/7em-logo.png",
            height: 50,
            width: 50,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Consumer<AuthViewModel>(builder: (context, signup, _) {
            return Form(
              key: formkeySignup,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Create Your Account',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      SizedBox(height: 30),
                      // Profile Icon
                      // Stack(
                      //   children: [
                      //     Icon(
                      //       Icons.account_circle_outlined,
                      //       size: 150,
                      //       color: Colors.black,
                      //     ),
                      //     Positioned(
                      //         bottom: 10,
                      //         right: 10,
                      //         child: Card(
                      //           color: Colors.white,
                      //           child: Icon(
                      //             Icons.cloud_upload,
                      //             size: 40,
                      //             color: Colors.black,
                      //           ),
                      //         ))
                      //   ],
                      // ),
                      // SizedBox(height: 20),
                      // // Name Input
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? "Enter Name" : null,
                        controller: signup.nameSignup,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colo.greycolorCode, width: 1.5),
                            //  BorderSide(
                            //   color: Colo.buttonPrimary,
                            //   width: 2.0,
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Email Input
                      TextFormField(
                        validator: (value) => Validator().validateEmail(value),
                        controller: signup.emailSignup,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colo.greycolorCode, width: 1.5),
                            //  BorderSide(
                            //   color: Colo.buttonPrimary,
                            //   width: 2.0,
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Phone Input
                      TextFormField(
                        validator: (value) => Validator().validateMobile(value),
                        keyboardType: TextInputType.number,
                        controller: signup.contactSignup,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          //                       IntlPhoneField(
                          //                   ...
                          //                   onChanged: (phone) {
                          //                     print(countries.firstWhere((element) => element['code'] == phone.countryISOCode)['max_length']);
                          //                   },
                          // ),
                          labelText: 'Phone',
                          labelStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colo.greycolorCode, width: 1.5),
                            //  BorderSide(
                            //   color: Colo.buttonPrimary,
                            //   width: 2.0,
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Dropdown for City
                      TextFormField(
                        obscureText: !signup.visibleSignup,
                        controller: signup.passwordSignup,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              signup.visibleSignup
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              signup
                                  .passwordVisibleSignup(); // Toggle visibility
                            },
                          ),
                          labelText: 'Password',
                          labelStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colo.greycolorCode, width: 1.5),
                            //  BorderSide(
                            //   color: Colo.buttonPrimary,
                            //   width: 2.0,
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // DropdownButtonFormField2<String>(
                      //   // dropdownColor: Colors.white,

                      //   isExpanded: true,
                      //   decoration: InputDecoration(
                      //     labelText: 'City',
                      // labelStyle: Theme.of(context).textTheme.bodySmall,
                      // floatingLabelBehavior: FloatingLabelBehavior.always,
                      //     border: OutlineInputBorder(),
                      //   ),
                      //   items: [
                      //     DropdownMenuItem(child: Text('Emirates'), value: 'Emirates'),
                      //     DropdownMenuItem(child: Text('sssssss'), value: 'sssssss'),
                      //     DropdownMenuItem(child: Text('oooooo'), value: 'oooooo'),
                      //     // Add more items as needed
                      //   ],
                      //   onChanged: (value) {},
                      // ),
                      // SizedBox(height: 20),
                      // // Proceed Button
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: signup.isloading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colo.buttonPrimary,
                                ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                  backgroundColor: Colo.buttonPrimary,
                                  // padding: EdgeInsets.symmetric(vertical: 16),
                                ),
                                onPressed: () {
                                  if (formkeySignup.currentState!.validate()) {
                                    signup.verifyEmail().then((v) {
                                      if (v) {
                                        signup.verifyOtpSignup().then((v) {
                                          if (v) {
                                            context.push('/otpVerifySignup');

                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             LoginScreen()));
                                          }
                                        });
                                      }
                                    });
                                  } else {
                                    ShowToast(msg: "Enter all Field");
                                  }
                                },
                                child: Text(
                                  'Proceed',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 18, color: Colors.white),
                                ),
                              ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      context.push('/login');
                      // Navigator.ush(context,
                      //     MaterialPageRoute(builder: (context) => SignupScreen()));
                    },
                    child: Text(
                      'Are you a registered user? Back to Login',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}