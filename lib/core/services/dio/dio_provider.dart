import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/base_response.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class DioProvider {
  static late final Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: Apis.baseUrl));
  }

  static Future<Either<Failure, dynamic>> postApi({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something Went Wrong"));
    }
  }

  static Future<Either<Failure, dynamic>> getApi({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.get(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something Went Wrong"));
    }
  }

  static Future<Either<Failure, dynamic>> putApi({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.put(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something Went Wrong"));
    }
  }

  static Future<Either<Failure, dynamic>> deleteApi({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.delete(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something Went Wrong"));
    }
  }

  static Future<Either<Failure, dynamic>> patchApi({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.patch(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something Went Wrong"));
    }
  }

  static Either<Failure, dynamic> _handleResponse(Response<dynamic> response) {
    var json = response.data as Map<String, dynamic>;
    if (json.containsKey('data')) {
      try {
        var baseResponse = BaseResponse.fromJson(response.data);
        return Right(baseResponse.data);
      } on Exception catch (e) {
        return Left(ParseFailure(message: e.toString()));
      }
    } else {
      return Right(response.data);
    }
  }

  static Failure _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkFailure(
          message: 'No internet Connection',
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        return ApiFailure(
          message: e.response?.data['message'],
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return ApiFailure(
          message: 'Request Was Cancelled',
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.unknown:
        return UnknownFailure(
          message: 'Something Went Wrong',
          statusCode: e.response?.statusCode,
        );
      default:
        return UnknownFailure(
          message: 'Something Went Wrong',
          statusCode: e.response?.statusCode,
        );
    }
  }

  static Future<Response> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.put(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.delete(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> patch({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.patch(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}
