import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/features/book_details/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:bookia/features/book_details/presentation/widgets/wishlist_action/cubit/wishlist_icon_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListIcon extends StatelessWidget {
  const WishListIcon({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistActionCubit(),
      child: BlocConsumer<WishlistActionCubit, DetailsState>(
        listener: (context, state) {
          if (state is DetailsSuccessState) {
            pop(context);
            showMyDialog(context, state.msg, type: DialogType.success);
          } else if (state is DetailsErrorState) {
            showMyDialog(context, 'Something went wrong');
          } else if (state is DetailsLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<WishlistActionCubit>();
          return IconButton(
            onPressed: () {
              if (cubit.isProductInWishlist(id)) {
                cubit.removeFromWishlist(id);
              } else {
                cubit.addTosWishlist(id);
              }
            },
            icon: cubit.isProductInWishlist(id)
                ? CustomSvgPicture(
                    path: AppImages.bookmark,
                    color: AppColors.primaryColor,
                  )
                : CustomSvgPicture(path: AppImages.bookmark),
          );
        },
      ),
    );
  }
}
