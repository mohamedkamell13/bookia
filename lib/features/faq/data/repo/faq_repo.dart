import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/faq/data/models/faq_models.dart';
import 'package:dartz/dartz.dart';

class FaqRepo {
  static Future<Either<Failure, List<FaqModel>>> getFaqs() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.faqs,
      headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
    );
    return response.fold((l) => left(l), (right) {
      // الـ getApi بيرجع الـ data object مباشرة
      // وجوا الـ data فيه faqs array
      // فبنوصله عن طريق right['faqs']
      final faqsList = right['faqs'] as List;
      return Right(faqsList.map((e) => FaqModel.fromJson(e)).toList());
    });
  }
}
