import 'package:bookia/features/place_order/data/models/governrate.dart';
import 'package:bookia/features/place_order/data/repository/place_order_repo.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitial());

  List<Governorate> governorates = [];

  Future<void> getGovernorates() async {
    emit(GovernoratesLoadingState());
    var response = await PlaceOrderRepo.getGovernorates();
    response.fold((l) => emit(GovernoratesErrorState()), (r) {
      governorates = r;
      emit(GovernoratesSuccessState());
    });
  }
}
