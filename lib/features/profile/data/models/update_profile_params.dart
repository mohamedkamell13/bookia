import 'dart:io';

import 'package:dio/dio.dart';

class UpdateProfileParams {
  String? name;
  String? address;
  String? phone;
  File? image;

  UpdateProfileParams({this.name, this.address, this.phone, this.image});

  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) {
    return UpdateProfileParams(
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'address': address,
    'phone': phone,
  };

  FormData toFormData() {
    // downloads/userImage.png
    FormData formData = FormData.fromMap({
      if (name != null) 'name': name,
      'address': address,
      if (phone != null) 'phone': phone,
      if (image != null)
        'image': MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last,
        ),
    });

    return formData;
  }
}
