import 'dart:convert';

import 'package:em/screen/account/delete_account.dart';
import 'package:em/screen/account/edit_profile-scree.dart';
import 'package:em/static/appbar_widget.dart';
import 'package:em/static/colors.dart';
import 'package:em/viewmodel/auth/login_viewmodel.dart';
import 'package:em/viewmodel/myAds/myads_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/login_model.dart';
import '../../viewmodel/home/home_viewmodel.dart';
import '../auth/forgetPassword/forget_password_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // String? name;
  // String? phone;
  // UserDetail? profile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // getUser();
      Provider.of<HomeViewModel>(context, listen: false).profileViewmodel();
    });
  }

  // getUser() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   name = await preferences.getString('name');
  //   phone = await preferences.getString('phone');
  //   var prof = await preferences.getString('profile');
  //   // print(prof);
  //   if (prof != null) {
  //     profile = UserDetail.fromJson(jsonDecode(prof));
  //     print(prof);
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<HomeViewModel>(builder: (context, profile, _) {
              return profile.profile == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(14)),
                      padding: EdgeInsets.only(
                          left: 10, right: 15, top: 5, bottom: 5),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Name : ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${profile.profile?.data!.name ?? ""}',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Email : ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${profile.profile?.data!.email ?? ""}',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Phone : ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${profile.profile?.data!.mobileNo ?? ""}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(letterSpacing: 3)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Balance : ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  '${profile.profile?.data!.currency ?? ""} ${profile.profile?.data!.balance ?? 0}',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
            }),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  // contentPadding:
                  // EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  // minVerticalPadding: 0,
                  // dense: true,
                  // contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(
                    Icons.manage_accounts_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                  title: Text('Manage Profile'),
                  onTap: () {
                    context.push('/profie/editProfile', extra: {
                      'id': '3',
                    });
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => EditProfilescreen()));
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                    size: 30,
                  ),
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                  title: Text('Change Password'),
                  onTap: () {
                    context.push('/profie/changePassword', extra: {
                      'id': '3',
                    });

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ForgetPassword()));
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(
                    Icons.info_outline_rounded,
                    size: 30,
                    color: Colors.grey,
                  ),
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                  title: Text('About'),
                  onTap: () {
                    Provider.of<myAdsViewmodel>(context, listen: false)
                        .loadHtml(type: "About", key: "abouts")
                        .then((v) {
                      if (v) {
                        context.push('/profie/showWeb', extra: {
                          'id': '3',
                        });
                      }
                    });
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(
                    Icons.help_outline,
                    color: Colors.grey,
                    size: 30,
                  ),
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                  title: Text('FAQs'),
                  onTap: () {
                    Provider.of<myAdsViewmodel>(context, listen: false)
                        .loadHtml(type: "FAQ", key: "faqs")
                        .then((v) {
                      if (v) {
                        context.push('/profie/showWeb', extra: {
                          'id': '3',
                        });
                      }
                    });
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(
                    Icons.article_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                  title: Text('Terms and Condition'),
                  onTap: () {
                    Provider.of<myAdsViewmodel>(context, listen: false)
                        .loadHtml(type: "Terms", key: "terms")
                        .then((v) {
                      if (v) {
                        context.push('/profie/showWeb', extra: {
                          'id': '3',
                        });
                      }
                    });
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                  title: Text('Privacy Policy'),
                  onTap: () {
                    Provider.of<myAdsViewmodel>(context, listen: false)
                        .loadHtml(type: "Privacy", key: "privacy")
                        .then((v) {
                      if (v) {
                        context.push('/profie/showWeb', extra: {
                          'id': '3',
                        });
                      }
                    });
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Image.asset(
                    "assets/logo/delete.png",
                    height: 30,
                    width: 30,
                    color: Colors.grey,
                    // Icons.privacy_tip_outlined,
                    //color: Colors.grey,
                    // size: 30,
                  ),
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                  title: Text('Delete My Account'),
                  onTap: () {
                    showDeleteAccountDialog(
                        context,
                        Provider.of<HomeViewModel>(context, listen: false)
                                .profile
                                ?.data!
                                .email ??
                            "");

                    // context.push('/profie/deleteAc', extra: {
                    //   'id': '3',
                    //   'deleteEmail':
                    //       Provider.of<HomeViewModel>(context, listen: false)
                    //               .profile
                    //               ?.data!
                    //               .email ??
                    //           ""
                    // });
                  },
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.login_outlined,
                      size: 30,
                      color: Colors.grey,
                    ),
                    titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                    title: Text('Logout'),
                    onTap: () async {
                      await Provider.of<AuthViewModel>(context, listen: false)
                          .Logout()
                          .then((v) {
                        if (v) {
                      // context.go('/home', extra: {'id': "0"});
                      context.go('/login');
                        }
                      });
                    },
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                // SizedBox(
                //   height: 58,
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 15, right: 15, top: 5, bottom: 5),
                //     child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10.0),
                //             ),
                //             backgroundColor: Colo.buttonPrimary),
                //         onPressed: () {},
                //         child: Text(
                //           "Logout",
                //           style: TextStyle(color: Colors.white),
                //         )),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Powered by CHAINTECH FZC',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
