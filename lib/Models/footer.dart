import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '© 2024 Drexler Cipriano. All Rights Reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

}
