import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:dartz/dartz.dart';

class ContactUsRepo {
  static Future<Either<Failure, bool>> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.contactUs,
      headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      data: {
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
      },
    );
    return response.fold((l) => left(l), (right) => const Right(true));
  }
}
