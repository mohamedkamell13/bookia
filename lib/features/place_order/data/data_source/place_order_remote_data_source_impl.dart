import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/features/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:bookia/features/place_order/data/models/governrate.dart';

class PlaceOrderRemoteDataSourceImpl implements PlaceOrderRemoteDataSource {
  @override
  Future<List<Governorate>> getGovernorates() async {
    var response = await DioProvider.getApi(endPoint: Apis.governorates);
    return response.fold(
      (l) => throw l,
      (right) => (right as List<dynamic>)
          .map((e) => Governorate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
