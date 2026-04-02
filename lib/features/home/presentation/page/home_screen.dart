import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/extensions.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller_builder.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:bookia/features/search/presentation/page/search_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..initLoad(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: CustomSvgPicture(path: AppImages.logoSVG, height: 30),
              actions: [
                IconButton(
                  onPressed: () {
                    final products = context.read<HomeCubit>().products;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(products: products),
                      ),
                    );
                  },
                  icon: CustomSvgPicture(path: AppImages.search),
                ),
                IconButton(
                  onPressed: () {
                    bool isArabic = context.isArabic;
                    context.setLocale(Locale(isArabic ? 'en' : 'ar'));
                  },
                  icon: Icon(Icons.language),
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
          );
        },
      ),
    );
  }
}
