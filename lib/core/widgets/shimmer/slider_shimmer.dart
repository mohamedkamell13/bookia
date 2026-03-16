import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderShimmer extends StatelessWidget {
  const SliderShimmer({super.key, required this.yourActiveIndex});

  final int yourActiveIndex;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Gap(14),
          AnimatedSmoothIndicator(
            activeIndex: yourActiveIndex,
            count: 3,
            effect: ExpandingDotsEffect(
              dotColor: AppColors.greyColor.withValues(alpha: 0.2),
              dotHeight: 7,
              dotWidth: 7,
              activeDotColor: AppColors.primaryColor,
              expansionFactor: 4,
            ),
          ),
        ],
      ),
    );
  }
}
