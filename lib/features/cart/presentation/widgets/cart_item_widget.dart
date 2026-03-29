import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    this.onRemove,
    this.onUpdate,
  });

  final CartItem item;
  final Function()? onRemove;
  final Function(int)? onUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.itemProductImage ?? '',
              width: 100,
              height: 118,
              fit: BoxFit.cover,
            ),
          ),
          Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.itemProductName}',
                            style: TextStyles.subtitle2,
                          ),
                          Gap(10),
                          Text(
                            '₹ ${item.itemProductPriceAfterDiscount}',
                            style: TextStyles.body,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: IconButton(
                        onPressed: onRemove,
                        icon: CustomSvgPicture(path: AppImages.remove),
                      ),
                    ),
                  ],
                ),
                Gap(15),
                Row(
                  spacing: 15,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          int quantity = item.itemQuantity ?? 0;
                          var updatedCount = quantity + 1;
                          if (updatedCount <= (item.itemProductStock ?? 0)) {
                            onUpdate!(updatedCount);
                          } else {
                            showMyDialog(context, 'Can\'t Add More Than Stock');
                          }
                        },
                        icon: Icon(Icons.add, size: 20),
                      ),
                    ),
                    Text('${item.itemQuantity}', style: TextStyles.subtitle2),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          int quantity = item.itemQuantity ?? 0;
                          var updatedCount = quantity - 1;
                          if (quantity > 1) {
                            onUpdate!(updatedCount);
                          } else {
                            showMyDialog(context, 'can\'t Remove Less Than 1');
                          }
                        },
                        icon: Icon(Icons.remove, size: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
