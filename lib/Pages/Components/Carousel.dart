import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myweb_portfolio/Utils/Screen_Helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myweb_portfolio/Models/Carousel_items_model.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../Models/footer.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);

    Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
      return Center(
          child: ResponsiveWrapper(
        maxWidth: 1000.0,
        minWidth: 1000.0,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(child: text),
            Expanded(child: image),
          ],
        ),
      ));
    }

    Widget _buildTablet(BuildContext context, Widget text, Widget image) {
      return Center(
          child: ResponsiveWrapper(
        maxWidth: 760.0,
        minWidth: 760.0,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(child: text),
            Expanded(child: image),
          ],
        ),
      ));
    }

    Widget _buildMobile(BuildContext context, Widget text, Widget image) {
      return Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .8,
        ),
        width: double.infinity,
        child: text,
      );
    }

    return Stack(
      children: [
        Positioned(
          bottom: 1,
            right: 1,
            left: 1,
            child: Footer()
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                child: CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 4),
                    viewportFraction: 1,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    height: carouselContainerHeight,
                  ),
                  items: List.generate(
                    carouselItems.length,
                    (index) => Builder(builder: (BuildContext context) {
                      return Container(
                        constraints: BoxConstraints(
                          minHeight: carouselContainerHeight,
                        ),
                        child: ScreenHelper(
                          desktop: _buildDesktop(
                            context,
                            carouselItems[index].text,
                            carouselItems[index].image,
                          ),
                          mobile: _buildMobile(
                            context,
                            carouselItems[index].text,
                            carouselItems[index].image,
                          ),
                          tablet: _buildTablet(
                            context,
                            carouselItems[index].text,
                            carouselItems[index].image,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
