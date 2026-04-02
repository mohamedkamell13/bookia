import 'package:bookia/features/auth/data/models/auth_response/user.dart';

class UpdateProfileResponse {
  User? data;
  String? message;
  List<dynamic>? error;
  int? status;

  UpdateProfileResponse({this.data, this.message, this.error, this.status});

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message,
    'error': error,
    'status': status,
  };
}
