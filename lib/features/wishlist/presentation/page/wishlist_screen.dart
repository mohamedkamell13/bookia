import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wishlist_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(title: Text('Wishlist', style: TextStyles.headline)),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: WishlistBuilder(),
        ),
      ),
    );
  }
}
