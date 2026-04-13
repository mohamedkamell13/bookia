import 'package:bookia/features/place_order/data/models/governrate.dart';

abstract class PlaceOrderRemoteDataSource {
  Future<List<Governorate>> getGovernorates();
}
