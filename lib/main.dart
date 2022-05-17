import 'package:flutter/material.dart';
import 'package:invoice/screens/profile_screen.dart';
import 'providers/user_provider.dart';

import 'package:invoice/screens/client_search_list.dart';
import 'package:invoice/screens/create_profile_screen.dart';
import 'package:invoice/screens/homepage_screen.dart';
import 'package:invoice/screens/invoice_screen.dart';
import 'package:invoice/screens/onboarding_screen.dart';
import 'package:invoice/screens/signin_screen.dart';
import 'package:invoice/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';


// git remote add origin https://github.com/INI75/E.Invoice.git
// git branch -M main
// git push -u origin main
void main() {
  runApp(const InvoiceApp());
}

class InvoiceApp extends StatelessWidget {
  const InvoiceApp({Key? key}) : super(key: key);
  static const Color _w = Colors.white;
  static const Color _black = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          //  maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        home: const SplashScreen(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: _w,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: _black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: _black,
            ),
          ),
          //////////////////////////////  how to create general text theme data   and finish up customizing client list search bar.............
        
          textTheme: TextTheme().copyWith(),
        ),
        routes: {
          OnboardingScreen.RouteName: (context) => const OnboardingScreen(),
          SignIn.RouteName: (context) => SignIn(),
          CreateProfile.RouteName: (context) => CreateProfile(),
          HomepageScreen.RouteName: (context) => HomepageScreen(),
          CreateInvoiceScreen.RouteName: (context) => CreateInvoiceScreen(),
          ClientListSearch.RouteName: (context) => ClientListSearch(),
       ProfileScreen.routeName:(context)=>ProfileScreen() ,},
      ),
    );
  }
}
