import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MySlideshow extends StatelessWidget {
  MySlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: slideshowItems,
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          // Handle page change here
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  List<Widget> slideshowItems = [
    //color: Colors.red,
    Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: AssetImage('assets/images/offer-1.png'),
              fit: BoxFit.fill)),
    ),
    Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: AssetImage('assets/images/offer-2.png'),
              fit: BoxFit.fill)),
    ),
    Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: AssetImage('assets/images/offer-3.png'),
              fit: BoxFit.fill)),
    ),
  ];
}
