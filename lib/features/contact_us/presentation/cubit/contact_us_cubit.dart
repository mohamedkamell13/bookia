import 'package:bookia/features/contact_us/domain/usecases/send_message_usecase.dart';
import 'package:bookia/features/contact_us/presentation/cubit/contact_us_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final SendMessageUseCase sendMessageUseCase;

  ContactUsCubit({required this.sendMessageUseCase})
    : super(ContactUsInitial());

  Future<void> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    emit(ContactUsLoadingState());
    var response = await sendMessageUseCase(
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
