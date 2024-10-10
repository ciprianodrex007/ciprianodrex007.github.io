import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myweb_portfolio/Utils/Const.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Models/Header_items.dart';

//
// class HeaderRow extends StatelessWidget {
//   const HeaderRow({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveVisibility(
//       visible: true, // Set to true to show by default
//       visibleWhen: [Condition.largerThan(name: MOBILE)],
//       child: Row(
//         children: headerItems.map((item) {
//           return item.isButton
//               ? MouseRegion(
//             cursor: SystemMouseCursors.click,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: kDangerColor,
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//               child: TextButton(
//                 onPressed: item.onTap,
//                 child: Text(
//                   item.title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 13,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           )
//               : MouseRegion(
//             cursor: SystemMouseCursors.click,
//             child: Container(
//               margin: EdgeInsets.only(right: 30.0),
//               child: GestureDetector(
//                 onTap: item.onTap,
//                 child: Text(
//                   item.title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 13.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
class HeaderRow extends StatelessWidget {
  final Function(int) onItemTapped; // Callback to pass the selected index
  final int selectedIndex; // Track which item is selected

  const HeaderRow({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> headerWidgets = headerItems.asMap().entries.map((entry) {
      int index = entry.key;
      HeaderItem item = entry.value;
      // Determine the background color based on whether the item is selected
      Color backgroundColor =
          selectedIndex == index ? kDangerColor : Colors.transparent;
      return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        child: item.isButton
            ? TextButton(
                onPressed: () {
                  onItemTapped(index); // Pass the index back to the parent
                },
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: selectedIndex == index
                        ? Colors.black // Change text color if selected
                        : Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      onItemTapped(index); // Pass the index back to the parent
                    },
                    child: Text(
                      item.title,
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.black // Change text color if selected
                            : Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
      );
    }).toList();
    // Add spacing between header items
    List<Widget> spacedHeaderWidgets = [];
    for (int i = 0; i < headerWidgets.length; i++) {
      spacedHeaderWidgets.add(headerWidgets[i]);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: spacedHeaderWidgets,
    );
  }
}
