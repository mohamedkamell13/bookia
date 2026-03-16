import 'package:bookia/features/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  List<Slider> sliders = [];
  List<Product> products = [];

  Future<void> initLoad() async {
    emit(HomeLoadingState());
    var homeResponse = await Future.wait([
      HomeRepo.getSlider(),
      HomeRepo.getBestSeler(),
    ]);
    var sliderResponse = homeResponse[0] as SliderResponse?;
    var bestSellerResponse = homeResponse[1] as BestSellerResponse?;
    if (sliderResponse != null || bestSellerResponse != null) {
      sliders = sliderResponse?.data?.sliders ?? [];
      products = bestSellerResponse?.data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}
