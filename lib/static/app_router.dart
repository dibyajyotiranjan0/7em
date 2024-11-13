import 'package:em/screen/home/showallads_seller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/account/change_password_screen.dart';
import '../screen/account/delete_account.dart';
import '../screen/account/edit_profile-scree.dart';
import '../screen/account/profile_screen.dart';
import '../screen/auth/forgetPassword/change_password_screen.dart';
import '../screen/auth/forgetPassword/forget_password_screen.dart';
import '../screen/auth/forgetPassword/verify_otp_screen.dart';
import '../screen/auth/login/login_screen.dart';
import '../screen/auth/signup/signup_screen.dart';
import '../screen/auth/signup/verify_signup_otp.dart';
import '../screen/error/error-screen.dart';
import '../screen/home/details_of_single_product.dart';
import '../screen/home/home_screen.dart';
import '../screen/home/household_appliances_screen.dart';
import '../screen/home/product_details_screen.dart';
import '../screen/home/real_state-screen.dart';
import '../screen/myAdd/myAdd_scree.dart';
import '../screen/myAdd/myadd_details.dart';
import '../screen/navigation/navigation_screen.dart';
import '../screen/sale/details_form_screen.dart';
import '../screen/sale/household_sale-form.dart';
import '../screen/sale/payment_screen.dart';
import '../screen/sale/sell_screen.dart';
import '../screen/sale/upload_image_screen.dart';
import '../screen/show_Webdata/show_web.dart';
import '../screen/splash_screen/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRoute {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/', //comment for implemetation
    // initialLocation: '/home',
    errorBuilder: (context, state) => ErrorScreen(),
    // redirect: (BuildContext context, GoRouterState state) async {
    //   final SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String? phone = await prefs.getString('phone');
    //   if (phone != null) {
    //     // return '/home';
    //     context.go('/home', extra: {'id': "0"});
    //     //return;
    //   } else {
    //     return null;
    //   }
    // },

    routes: [
      GoRoute(
        path: '/',
        name: "Splash Screen",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/veryfypassword',
        name: "VerifyPassword",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => VerifyOtpScreen(),
      ),
      GoRoute(
        path: '/changePassword',
        name: "SchangePassword",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => ChangePassword(),
      ),
      GoRoute(
        path: '/forgetPassword',
        name: "ForgetPassword",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => ForgetPassword(),
      ),

      GoRoute(
        path: '/signup',
        name: "Signup",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: '/login',
        name: "Login",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
          path: '/otpVerifySignup',
          name: "verifyOtpSignup",
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) {
            // Map<String, dynamic>? parameter =
            //     state.extra as Map<String, dynamic>?;
            return VerifySignupOtp();
          }), //
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          Map<String, dynamic>? parameter =
              state.extra as Map<String, dynamic>?;
          // print(parameter!['id']);
          // int index = 0;
          return NavigationScreen(
            child: child,
            // index: 0,
            index: int.parse(parameter?['id'] ??
                "0"), //parameter!['id'] ??  comment for implement
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            name: "Home",
            // parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) {
              Map<String, dynamic>? parameter =
                  state.extra as Map<String, dynamic>?;
              return HomeScreen(
                sear: parameter!['sea'],
              );
            },
            routes: [
              //LiftRequestSuccessScreen
              GoRoute(
                path: 'details',
                name: "details",
                parentNavigatorKey: _shellNavigatorKey,
                builder: (context, state) {
                  Map<String, dynamic>? parameter =
                      state.extra as Map<String, dynamic>?;
                  return ProductDetailsScreen(
                    details: parameter!['details'],
                  );
                },
              ),
              GoRoute(
                path: 'household',
                name: "household",
                parentNavigatorKey: _shellNavigatorKey,
                builder: (context, state) => HouseholdAppliancesScreen(),
              ),
              GoRoute(
                path: 'realstate',
                name: "realstate",
                parentNavigatorKey: _shellNavigatorKey,
                builder: (context, state) => FilterScreen(),
              ),

              GoRoute(
                  path: 'showpay',
                  name: "showpay",
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    Map<String, dynamic>? parameter =
                        state.extra as Map<String, dynamic>?;
                    return ShowAlladsSealler(
                        name: parameter!['adsName'].toString(),
                        adsID: parameter!['adsID'].toString());
                  },
                  routes: [
                    GoRoute(
                      path: 'dt',
                      name: "dt",
                      parentNavigatorKey: _shellNavigatorKey,
                      builder: (context, state) {
                        Map<String, dynamic>? parameter =
                            state.extra as Map<String, dynamic>?;
                        return SingleProductDetail(
                          details: parameter!["details"],
                        );
                      },
                    ),
                  ]),
              // GoRoute(
              //   path: 'driverchat',
              //   name: "chatDriver",
              //   parentNavigatorKey: _shellNavigatorKey,
              //   builder: (context, state) => ChatScreen(),
              // ),
              // GoRoute(
              //   path: 'pickup',
              //   name: "Pickup",
              //   parentNavigatorKey: _shellNavigatorKey,
              //   builder: (context, state) => const PickUpLocation(),
              // ),
              // GoRoute(
              //   path: 'dest',
              //   name: "Destination",
              //   parentNavigatorKey: _shellNavigatorKey,
              //   builder: (context, state) => const DestinationLocation(),
              // ),
              // GoRoute(
              //   path: 'bookingsr1',
              //   name: "BookingScreen1",
              //   parentNavigatorKey: _shellNavigatorKey,
              //   builder: (context, state) => const BookingScreenfirst(),
              // ), //DriverFindScreen() ConfrmRideBooking
              // //  GoRoute(
              // //   path: 'searchDriver',
              // //   name: "searchDriver",
              // //   parentNavigatorKey: _shellNavigatorKey,
              // //   builder: (context, state) => const searchDriver(),
              // // ),

              // GoRoute(
              //     path: 'driverfindscr',
              //     name: "driverfindScr",
              //     parentNavigatorKey: _shellNavigatorKey,
              //     builder: (context, state) {
              //       Map<String, dynamic>? parameter =
              //           state.extra as Map<String, dynamic>?;
              //       return DriverFindScreen(
              //         bookingId: parameter!['bookingID'],
              //       );
              //     }), //DriverFindScreen() ConfrmRideBooking
              // GoRoute(
              //   path: 'conformBooking',
              //   name: "conformBooking",
              //   parentNavigatorKey: _shellNavigatorKey,
              //   builder: (context, state) => const ConfrmRideBooking(),
              // ), //LiftDriverList
              // GoRoute(
              //   path: 'liftbook',
              //   name: "liftbook",
              //   parentNavigatorKey: _shellNavigatorKey,
              //   builder: (context, state) => const LiftDriverList(),
              // ), //LiftBookingSelectVechicle
              // GoRoute(
              //   path: 'liftVechSelect',
              //   name: "liftVechSelect",
              //   parentNavigatorKey: _shellNavigatorKey,
              //   builder: (context, state) => const LiftBookingSelectVechicle(),
              // ), //LiftDriverShow
              // GoRoute(
              //   path: 'liftDriverShow',
              //   name: "liftDriverShow",
              //   parentNavigatorKey: _shellNavigatorKey,
              //   builder: (context, state) => const LiftDriverShow(),
              // ), //ThankyouScreen
              // GoRoute(
              //   path: 'thankyouScreen',
              //   name: "thankyouScreen",
              //   parentNavigatorKey: _shellNavigatorKey,
              //   builder: (context, state) => const ThankyouScreen(),
              // ), //
            ],
          ),

          GoRoute(
              path: '/sellScreen',
              name: "SellScreen",
              // parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => SellScreen(),
              routes: [
                GoRoute(
                  path: 'realstateSell',
                  name: "realstateSell",
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    Map<String, dynamic>? parameter =
                        state.extra as Map<String, dynamic>?;
                    return DetailsFormScreen(
                        // details: parameter!['details'],
                        );
                  },
                ), //LiftbookingDetail
                GoRoute(
                  path: 'householdSale',
                  name: "householdSale",
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    Map<String, dynamic>? parameter =
                        state.extra as Map<String, dynamic>?;
                    return householdFormScreen(
                        // details: parameter!['details'],
                        );
                  },
                ),
                GoRoute(
                  path: 'addmoreImage',
                  name: "addmoreImage",
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    Map<String, dynamic>? parameter =
                        state.extra as Map<String, dynamic>?;
                    return UploadImageScreen(
                      page: parameter!['img'],
                      // details: parameter!['details'],
                    );
                  },
                ),
                GoRoute(
                  path: 'packageSelection',
                  name: "packageSelection",
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    Map<String, dynamic>? parameter =
                        state.extra as Map<String, dynamic>?;
                    return PackageSelectionScreen(
                      page: parameter!['sale'],
                    );
                  },
                ), // //
              ]),
          //FullDetaisTrip()
          GoRoute(
              path: '/profie',
              name: "Profile",
              // parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => ProfileScreen(),
              routes: [
                GoRoute(
                  path: 'editProfile',
                  name: "editProfile",
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    Map<String, dynamic>? parameter =
                        state.extra as Map<String, dynamic>?;
                    return EditProfilescreen(
                        // userDetails: parameter!['user'],
                        // urll: parameter!['url'],
                        );
                  },
                ),
                GoRoute(
                  path: 'changePassword',
                  name: "changePassword",
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    Map<String, dynamic>? parameter =
                        state.extra as Map<String, dynamic>?;
                    return ChangePasswordLog(
                        // userDetails: parameter!['user'],
                        // urll: parameter!['url'],
                        );
                  },
                ),
                GoRoute(
                  path: 'showWeb',
                  name: "showWeb",
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    Map<String, dynamic>? parameter =
                        state.extra as Map<String, dynamic>?;
                    return ShowWeb(
                        // userDetails: parameter!['user'],
                        // urll: parameter!['url'],
                        );
                  },
                ),
                // GoRoute(
                //   path: 'deleteAc',
                //   name: "deleteAc",
                //   parentNavigatorKey: _shellNavigatorKey,
                //   builder: (context, state) {
                //     Map<String, dynamic>? parameter =
                //         state.extra as Map<String, dynamic>?;
                //     return DeleteAccount(
                //       // userDetails: parameter!['user'],
                //       email: parameter!['deleteEmail'],
                //     );
                //   },
                // ),
              ]),
          GoRoute(
              path: '/myadd',
              name: "MyAdd",
              // parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => MyAddscreen(),
              routes: [
                GoRoute(
                  path: 'adsDetails',
                  name: "adsDetails",
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    Map<String, dynamic>? parameter =
                        state.extra as Map<String, dynamic>?;
                    return myAdsDetailsScreen(
                      details: parameter!['myAds'],
                    );
                  },
                ),
              ]),
        ],
      )
    ],
  );
}
