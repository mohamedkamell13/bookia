import 'package:bookia/features/contact_us/data/repo/contact_us_repo.dart';
import 'package:bookia/features/contact_us/presentation/cubit/contact_us_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  Future<void> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    emit(ContactUsLoadingState());
    var response = await ContactUsRepo.sendMessage(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );
    response.fold(
      (l) => emit(ContactUsErrorState(l.message)),
      (r) => emit(ContactUsSuccessState()),
    );
  }
}
