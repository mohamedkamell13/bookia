import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/home/presentation/page/home_screen.dart';
import 'package:bookia/features/wishlist/presentation/page/wishlist_screen.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    Center(child: Text('Cart')),
    Center(child: Text('profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImages.home),
            activeIcon: CustomSvgPicture(
              path: AppImages.home,
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImages.bookmark),
            activeIcon: CustomSvgPicture(
              path: AppImages.bookmark,
              color: AppColors.primaryColor,
            ),
            label: 'BookMark',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImages.cart),
            activeIcon: CustomSvgPicture(
              path: AppImages.cart,
              color: AppColors.primaryColor,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImages.profile),
            activeIcon: CustomSvgPicture(
              path: AppImages.profile,
              color: AppColors.primaryColor,
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
