import 'package:flutter/material.dart';
import 'package:myweb_portfolio/Pages/home.dart';
import 'package:myweb_portfolio/Utils/Const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Drexler's Portfolio",
        themeMode: ThemeMode.dark,
        darkTheme: Theme.of(context).copyWith(
          platform: TargetPlatform.android,
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          canvasColor: kBackgroundColor,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true, // Fixes case sensitivity
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.resize(2460, name: "4k"),
        ],
          background: Container(
          color: kBackgroundColor,
      )
      ),
      home: const HomeScreen(),
    );
  }
}
