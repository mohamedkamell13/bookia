import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/routes/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/book_details/presentation/widgets/cart_action/cubit/cart_action_cubit.dart';
import 'package:bookia/features/book_details/presentation/widgets/cart_action/cubit/cart_action_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartActionWidget extends StatelessWidget {
  const CartActionWidget({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartActionCubit>(),
      child: BlocConsumer<CartActionCubit, CartActionState>(
        listener: (context, state) {
          if (state is CartActionsSuccessState) {
            pop(context);
            showMyDialog(context, state.msg, type: DialogType.success);
          } else if (state is CartActionsErrorState) {
            pop(context);
            showMyDialog(context, 'failedCart'.tr());
          } else if (state is CartActionsLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.watch<CartActionCubit>();
          bool isInCart = cubit.isProductInCart(id);

          return MainButton(
            text: isInCart ? 'addedToCart'.tr() : 'AddToCart'.tr(),
            onPressed: () {
              if (isInCart) {
                cubit.removeFromCart(id);
              } else {
                cubit.addToCart(id);
              }
            },
            minWidth: 212,
            bgColor: isInCart ? AppColors.primaryColor : AppColors.blackColor,
          );
        },
      ),
    );
  }
}
