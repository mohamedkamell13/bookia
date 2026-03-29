import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/features/book_details/presentation/widgets/cart_action/cart_icon.dart';
import 'package:bookia/features/book_details/presentation/widgets/wishlist_action/wishlist_icon.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.model});
  final Product model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        actions: [WishlistActionWidget(id: model.id ?? 0)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.network(
                  model.image ?? '',
                  width: 183,
                  height: 271,
                ),
              ),
              Gap(11),
              Text(
                model.name ?? '',
                style: TextStyles.headline,
                textAlign: TextAlign.center,
              ),
              Gap(11),
              Text(
                model.category ?? '',
                style: TextStyles.body.copyWith(color: AppColors.primaryColor),
              ),
              Gap(16),
              Text(
                model.description ?? '',
                style: TextStyles.caption2.copyWith(
                  color: AppColors.blackColor,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('₹${model.price ?? ''}', style: TextStyles.title),
            CartActionWidget(id: model.id ?? 0),
          ],
        ),
      ),
    );
  }
}
