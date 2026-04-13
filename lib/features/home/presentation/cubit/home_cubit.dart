import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:bookia/features/home/domain/usecases/get_best_seller_usecase.dart';
import 'package:bookia/features/home/domain/usecases/get_slider_usecase.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSliderUseCase getSliderUseCase;
  final GetBestSellerUseCase getBestSellerUseCase;

  HomeCubit({
    required this.getSliderUseCase,
    required this.getBestSellerUseCase,
  }) : super(HomeInitialState());

  List<Slider> sliders = [];
  List<Product> products = [];

  Future<void> initLoad() async {
    emit(HomeLoadingState());

    var sliderResponse = await getSliderUseCase();
    var bestSellerResponse = await getBestSellerUseCase();

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
