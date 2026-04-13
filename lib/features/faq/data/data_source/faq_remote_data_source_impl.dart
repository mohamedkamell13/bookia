import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/faq/data/data_source/faq_remote_data_source.dart';
import 'package:bookia/features/faq/data/models/faq_models.dart';

class FaqRemoteDataSourceImpl implements FaqRemoteDataSource {
  @override
  Future<List<FaqModel>> getFaqs() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.faqs,
      headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
    );
    return response.fold((l) => throw l, (right) {
      final faqsList = right['faqs'] as List;
      return faqsList.map((e) => FaqModel.fromJson(e)).toList();
    });
  }
}
