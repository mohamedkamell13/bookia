class VerifyCodeParams {
  String? email;
  int? verifyCode;

  VerifyCodeParams({this.email, this.verifyCode});

  Map<String, dynamic> toJson() => {'email': email, 'verify_code': verifyCode};
}
