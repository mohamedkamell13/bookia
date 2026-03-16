import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller_builder.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..initLoad(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: CustomSvgPicture(path: AppImages.logoSVG, height: 30),
          actions: [
            IconButton(
              onPressed: () {},
              icon: CustomSvgPicture(path: AppImages.search),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                HomeSlider(),
                Gap(30),
                BestSellerBuilder(),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
