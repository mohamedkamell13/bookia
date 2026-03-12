import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int yourActiveIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppImages.welcome,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
          options: CarouselOptions(
            height: 150,
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reson) {
              setState(() {
                yourActiveIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Gap(14),
        AnimatedSmoothIndicator(
          activeIndex: yourActiveIndex,
          count: 6,
          effect: ExpandingDotsEffect(
            dotColor: AppColors.greyColor.withValues(alpha: 0.2),
            dotHeight: 7,
            dotWidth: 7,
            activeDotColor: AppColors.primaryColor,
            expansionFactor: 4,
          ),
        ),
      ],
    );
  }
}
