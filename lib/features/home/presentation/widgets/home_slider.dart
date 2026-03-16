import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/shimmer/slider_shimmer.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          var sliders = context.read<HomeCubit>().sliders;
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            sliders[itemIndex].image ?? '',
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
                count: sliders.length,
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
        } else {
          return SliderShimmer(yourActiveIndex: yourActiveIndex);
        }
      },
    );
  }
}
