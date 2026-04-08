import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/models/best_seller_response/data.dart'
    as best_seller;
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/home/data/models/slider_response/data.dart'
    as slider;
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  List<Slider> sliders = [];
  List<Product> products = [];

  Future<void> initLoad() async {
    emit(HomeLoadingState());

    Either<Failure, slider.Data> sliderResponse = await HomeRepo.getSlider();
    Either<Failure, best_seller.Data> bestSellerResponse =
        await HomeRepo.getBestSeller();

    sliderResponse.fold(
      (l) => emit(HomeErrorState()),
      (r) => sliders = r.sliders ?? [],
    );

    bestSellerResponse.fold(
      (l) => emit(HomeErrorState()),
      (r) => products = r.products ?? [],
    );

    if (state is! HomeErrorState) {
      emit(HomeSuccessState());
    }
  }
}
