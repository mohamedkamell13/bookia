import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/shimmer/list_shimmer.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartBuilder extends StatelessWidget {
  const CartBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CheckoutLoadingState) {
          showLoadingDialog(context);
        } else if (state is CheckoutSuccessState) {
          Navigator.pop(context);
          var cubit = context.read<CartCubit>();
          pushTo(context, Routes.placeOrder, extra: cubit.total);
        } else if (state is CheckoutErrorState) {
          Navigator.pop(context); // Close loading dialog
          showMyDialog(context, 'Failed to checkout. Please try again.');
        }
      },
      buildWhen: (_, state) =>
          state is CartSuccessState ||
          state is CartErrorState ||
          state is CartLoadingState,
      builder: (context, state) {
        if (state is CartSuccessState) {
          var cubit = context.read<CartCubit>();
          if (cubit.products.isEmpty) {
            return const Center(child: Text('No books in cart'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cubit.products.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                      item: cubit.products[index],
                      onRemove: () {
                        cubit.removeFromCart(cubit.products[index].itemId ?? 0);
                      },
                      onUpdate: (count) {
                        cubit.updateCart(
                          cubit.products[index].itemId ?? 0,
                          count,
                        );
                      },
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyles.subtitle1.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                      Text('\$ ${cubit.total}', style: TextStyles.subtitle1),
                    ],
                  ),
                  Gap(20),
                  MainButton(
                    text: 'Checkout',
                    onPressed: () {
                      cubit.checkout();
                    },
                  ),
                ],
              ),
            ],
          );
        } else {
          return ListShimmer();
        }
      },
    );
  }
}
