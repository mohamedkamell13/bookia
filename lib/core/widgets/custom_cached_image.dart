import 'package:bookia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    this.cubit,
    required this.url,
    this.width,
    this.height,
    required this.errorWidget,
    required this.progressIndicator,
  });

  final ProfileCubit? cubit;
  final String url;
  final double? width;
  final double? height;
  final Widget errorWidget;
  final Widget progressIndicator;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      progressIndicatorBuilder: (_, _, _) => progressIndicator,
      errorWidget: (context, url, error) => errorWidget,
    );
  }
}
