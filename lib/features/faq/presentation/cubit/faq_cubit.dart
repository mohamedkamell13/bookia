import 'package:bookia/features/faq/data/models/faq_models.dart';
import 'package:bookia/features/faq/data/repo/faq_repo.dart';
import 'package:bookia/features/faq/presentation/cubit/faq_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  List<FaqModel> faqs = [];

  Future<void> getFaqs() async {
    emit(FaqLoadingState());
    var response = await FaqRepo.getFaqs();
    response.fold((l) => emit(FaqErrorState(l.message)), (r) {
      faqs = r;
      emit(FaqSuccessState());
    });
  }
}
