import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadeeth/hadeeth_card.dart';

class Hadeeth extends StatelessWidget {
  const Hadeeth({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 0.745,
            initialPage: 0,
            enlargeCenterPage: true,
            enlargeFactor: 0.27,
          ),
          itemCount: 50,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return HadeethCard(index: itemIndex);
          },
        ),
      ),
    );
  }
}
