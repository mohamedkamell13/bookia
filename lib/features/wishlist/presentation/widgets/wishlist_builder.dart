import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/book_card.dart';
import 'package:bookia/core/widgets/shimmer/grid_shimmer.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBuilder extends StatelessWidget {
  const WishlistBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        var cubit = context.read<WishlistCubit>();
        if (state is WishListSuccessState) {
          var books = cubit.products;
          if (books.isEmpty) {
            return Center(
              child: Text('No books in wishlist', style: TextStyles.body),
            );
          }
          return GridView.builder(
            itemCount: books.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return BookCard(
                product: books[index],
                onRemoveFromWishlist: () {
                  cubit.removeFromsWishlist(books[index].id ?? 0);
                },
                onRefresh: () {
                  cubit.getWishlist();
                },
              );
            },
          );
        } else {
          return GridShimmer(
            itemCount: 4,
            crossAxisCount: 2,
            mainAxisSpacing: 11,
            crossAxisSpacing: 11,
            childAspectRatio: .6,
            shrinkWrap: false,
          );
        }
      },
    );
  }
}
