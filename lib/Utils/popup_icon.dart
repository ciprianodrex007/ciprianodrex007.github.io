import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class PopupIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String url;
  const PopupIcon(
      {super.key, required this.icon, required this.color, required this.text, required this.url});

  @override
  State<PopupIcon> createState() => _PopupIconState();
}

class _PopupIconState extends State<PopupIcon> {
  bool onIt = false;

  // Function to launch the URL
  void _launchURL() async {
    if (await canLaunch(widget.url)) {
      await launch(widget.url);
    } else {
      throw 'Could not launch ${widget.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: onIt ? 1.0 : 0.0,
            curve: onIt ? Curves.easeOutBack : Curves.easeIn,
            duration: Duration(milliseconds: 200),
            child: AnimatedAlign(
              curve: onIt ? Curves.easeOutBack : Curves.easeIn,
              alignment: onIt ? Alignment(0.0, -1.0) : Alignment(0.0, 0.0),
              duration: Duration(milliseconds: 200),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 45,
                    top: 30.0,
                    child: Transform(
                      transform: Matrix4.rotationZ(pi / 4),
                      alignment: FractionalOffset.center,
                      child: Container(
                        height: 10.0,
                        width: 10.0,
                        color: widget.color,
                      ),
                    ),
                  ),
                  Container(
                    height: 35.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: widget.color,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        widget.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,  // Limit to one line
                        minFontSize: 12.0,  // Minimum font size
                        maxFontSize: 16.0,  // Maximum font size
                      ),
                    ),
                    ),
                ],
              ),
            ),
          ),
          // This is the animated icon container
          Align(
            alignment: Alignment.bottomCenter, // Align the icon to the bottom center
            child: GestureDetector(
              onTap: _launchURL, // Call the _launchURL function on tap
              child: MouseRegion(
                onEnter: (value) {
                  setState(() {
                    onIt = true;
                  });
                },
                onExit: (value) {
                  setState(() {
                    onIt = false;
                  });
                },
                child: AnimatedContainer(
                  height: 50.0,
                  width: 50.0,
                  duration: Duration(milliseconds: 375),
                  decoration: BoxDecoration(
                    color: onIt ? Colors.white : widget.color,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Icon(
                    widget.icon,
                    color: onIt ? widget.color : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}