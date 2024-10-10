import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myweb_portfolio/Utils/Const.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselItemModel {
  final Widget text;
  final Widget image;

  CarouselItemModel({
    required this.text,
    required this.image,
  });
}

List<CarouselItemModel> carouselItems = [
  CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Aspiring Cloud Engineer",
            style: GoogleFonts.oswald(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 18.0),
          Text(
            "Hi, I'm",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          Text(
            "Drexler Cipriano",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "A aspiring Cloud Engineer and Full Stack Developer based in Laguna",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 15.0,
              height: 1.0,
            ),
          ),
          SizedBox(height: 25),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 48.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Get to Know Me",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 48.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "View My Work",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ])
        ],
      ),
    ),
    image: Image.asset(
      'assets/memee.png',
      fit: BoxFit.contain,
    ),
  ),
  CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Full Stack Developer",
            style: GoogleFonts.oswald(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 18.0),
          Text(
            "Crafting Digital Experiences",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          Text(
            "Delivering Custom Web & Mobile Apps",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "I create modern, responsive applications that work across platforms.",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 15.0,
              height: 1.0,
            ),
          ),
          SizedBox(height: 25),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 48.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "See Projects",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    ),
    image: Image.asset(
      'assets/cloud.png',
      fit: BoxFit.contain,
    ),
  ),
];


