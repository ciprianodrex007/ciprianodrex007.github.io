import 'package:flutter/material.dart';
import 'package:myweb_portfolio/Pages/Components/Carousel.dart';
import 'package:myweb_portfolio/Pages/home.dart';

import '../Pages/my_intro.dart';
//
// class HeaderItem {
//   final String title;
//   final VoidCallback onTap;
//   final bool isButton;
//
//   HeaderItem({required this.title, required this.onTap, this.isButton = false});
// }
// List<HeaderItem> headerItems = [
//   HeaderItem(title: "HOME", onTap: () {
//         (BuildContext context) {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Carousel()));
//     };
//
//   }),
//   HeaderItem(title: "MY INTRO", onTap: () {
//         (BuildContext context) {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => MyIntro()));
//     };
//   }),
//   HeaderItem(title: "SERVICES", onTap: () {}),
//   HeaderItem(title: "PORTFOLIO", onTap: () {}),
//   HeaderItem(title: "TESTIMONIALS", onTap: () {}),
//   HeaderItem(title: "BLOGS", onTap: () {}),
//   HeaderItem(title: "HIRE ME", onTap: () {}, isButton: true),
// ];



class HeaderItem {
  final String title;
  final bool isButton;
  final Function(BuildContext) onTap;

  HeaderItem({required this.title, required this.onTap, this.isButton = false});
}
List<HeaderItem> headerItems = [
  HeaderItem(title: "HOME", onTap: (BuildContext context) {
  }),
  HeaderItem(title: "MY INTRO", onTap: (BuildContext context) {
  }),
  HeaderItem(title: "PORTFOLIO", onTap: (BuildContext context) {
  }),
  HeaderItem(title: "TESTIMONIALS", onTap: (BuildContext context) {
  }),
  HeaderItem(title: "BLOGS", onTap: (BuildContext context) {
  }),
  HeaderItem(title: "HIRE ME", onTap: (BuildContext context) {
  }, isButton: true),
];