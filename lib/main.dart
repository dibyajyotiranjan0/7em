import 'package:em/screen/sale/sell_screen.dart';
import 'package:em/static/app_router.dart';
import 'package:em/viewmodel/auth/login_viewmodel.dart';
import 'package:em/viewmodel/home/home_viewmodel.dart';
import 'package:em/viewmodel/master/all_master_viewmodel.dart';
import 'package:em/viewmodel/sale/sale_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'viewmodel/myAds/myads_viewmodel.dart';
import 'viewmodel/tab_update/tab_update_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // StreamProvider<InternetConnectionStatus>(
        //   initialData: InternetConnectionStatus.connected,
        //   create: (_) {
        //     return InternetConnectionChecker().onStatusChange;
        //   },
        // ),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => MasterViewModel()),
        ChangeNotifierProvider(create: (_) => SaleViewModel()),

        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => myAdsViewmodel()),
        ChangeNotifierProvider(create: (_) => TabUpdateViewmodel()),
      ],
      child: MaterialApp.router(
        title: '7em',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // fontFamily: '',
            textTheme: GoogleFonts.redHatDisplayTextTheme(
              // Replace 'roboto' with the font you want
              // Theme.of(context).textTheme,
              Theme.of(context).textTheme.copyWith(
                    displayLarge: const TextStyle(
                      fontFamily: 'RedHatDisplay-Light',
                      fontWeight: FontWeight.bold,
                    ),
                    displayMedium: const TextStyle(
                      fontFamily: 'RedHatDisplay-Light',
                      fontWeight: FontWeight.w500,
                    ),
                    bodyLarge: const TextStyle(
                      fontFamily: 'RedHatDisplay-Light',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    bodyMedium: const TextStyle(
                        fontFamily: 'RedHatDisplay-Light',
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    bodySmall: const TextStyle(
                        fontFamily: 'RedHatDisplay-Light',
                        // fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
            ),
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarColor:
                      Colors.indigoAccent, // Navigation bar
                  statusBarColor: Colors.indigo, // Status bar
                ),
                backgroundColor: Colors.white)),
        routerConfig: AppRoute.router,
        // home: SplashScreen(),
        // home: SellScreen(),
      ),
    );
  }
}
