import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/features/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<SliderResponse?> getSlider() async {
    try {
      var response = await DioProvider.get(endPoint: Apis.sliders);
      if (response.statusCode == 200) {
        return SliderResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<BestSellerResponse?> getBestSeler() async {
    try {
      var response = await DioProvider.get(endPoint: Apis.bestSellers);
      if (response.statusCode == 200) {
        return BestSellerResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
