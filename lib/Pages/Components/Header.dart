import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myweb_portfolio/Utils/Globals.dart';
import 'package:myweb_portfolio/Utils/Logo.dart';
import 'package:myweb_portfolio/Utils/Logo_Row.dart';
import 'package:myweb_portfolio/Utils/Screen_Helper.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Header extends StatelessWidget {
  final Function(int) onItemTapped; // Accepting the callback
  final int selectedIndex;
  const Header({super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }

  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldkey.currentState?.openEndDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(onItemTapped: onItemTapped, selectedIndex: selectedIndex,), // Pass the callback here
        ],
      ),
    );
  }
}
