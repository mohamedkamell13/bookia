import 'package:bookia/features/faq/data/models/faq_models.dart';

abstract class FaqRemoteDataSource {
  Future<List<FaqModel>> getFaqs();
}
