import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myweb_portfolio/Models/Header_items.dart';
import 'package:myweb_portfolio/Utils/Const.dart';
import 'package:myweb_portfolio/Utils/Globals.dart';

import '../Models/footer.dart';
import 'Components/Carousel.dart';
import 'Components/ComingSoon.dart';
import 'Components/Header.dart';
import 'my_intro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0; // Variable to track which header item is selected

  // This method updates the index when a header item is clicked
  void updateIndex(int index) {
    if (index != currentIndex) {
      // Only update if a different index is selected
      setState(() {
        currentIndex = index; // Update the current index
      });
    }
  }

  // List of widgets to display for each header item
  final List<Widget> screens = [
    Carousel(), // Index 0 - Initial screen (Carousel)
    MyIntro(), // Index 1 - My Intro content
    ComingSoon(), // Index 3 - Portfolio placeholder
    ComingSoon(), // Index 4 - Testimonials placeholder
    ComingSoon(), // Index 5 - Blogs placeholder
    ComingSoon(), // Index 6 - Hire Me placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldkey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: () {
                              updateIndex(index); // Update the screen content
                            },
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          updateIndex(index); // Update the screen content
                        },
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10.0);
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(106.0),
        child: Header(
            onItemTapped: updateIndex,
            selectedIndex: currentIndex), // Pass the callback
      ),
      body:
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            // Set the duration for the fade animation
            child: screens[currentIndex], // Display the selected content
          ),
    );
  }
}
