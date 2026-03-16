import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.bookDetails, extra: product);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.creamyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(5),
            SizedBox(
              height: 48,
              child: Text(
                product.name ?? '',
                style: TextStyles.subtitle2,
                maxLines: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(product.price ?? '', style: TextStyles.body),
                ),
                MainButton(
                  bgColor: AppColors.blackColor,
                  text: 'Buy',
                  onPressed: () {},
                  minWidth: 70,
                  minHeight: 28,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
