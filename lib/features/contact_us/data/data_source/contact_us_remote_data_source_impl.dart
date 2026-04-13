import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/contact_us/data/data_source/contact_us_remote_data_source.dart';

class ContactUsRemoteDataSourceImpl implements ContactUsRemoteDataSource {
  @override
  Future<bool> sendMessage({
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
    return response.fold((l) => throw l, (right) => true);
  }
}
