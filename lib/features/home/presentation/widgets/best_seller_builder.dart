import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/book_card.dart';
import 'package:bookia/core/widgets/shimmer/grid_shimmer.dart';
import 'package:bookia/core/widgets/shimmer/text_shimmer.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var bestSellers = context.read<HomeCubit>().products;
        if (state is HomeSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Best Seller', style: TextStyles.title),
              Gap(15),
              GridView.builder(
                itemCount: bestSellers.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) =>
                    BookCard(product: bestSellers[index]),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextShimmer(width: 120),
              GridShimmer(
                itemCount: bestSellers.length,
                crossAxisCount: 2,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                childAspectRatio: 0.6,
              ),
            ],
          );
        }
      },
    );
  }
}
