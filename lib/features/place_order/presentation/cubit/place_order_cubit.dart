import 'package:bookia/features/place_order/data/models/governrate.dart';
import 'package:bookia/features/place_order/domain/usecases/get_governorates_usecase.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  final GetGovernoratesUseCase getGovernoratesUseCase;

  PlaceOrderCubit({required this.getGovernoratesUseCase})
    : super(PlaceOrderInitial());

  List<Governorate> governorates = [];

  Future<void> getGovernorates() async {
    emit(GovernoratesLoadingState());
    var response = await getGovernoratesUseCase();
    response.fold((l) => emit(GovernoratesErrorState()), (r) {
      governorates = r;
      emit(GovernoratesSuccessState());
    });
  }
}
