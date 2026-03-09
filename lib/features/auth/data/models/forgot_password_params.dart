class ForgotPasswordParams {
  String? email;

  ForgotPasswordParams({this.email});

  Map<String, dynamic> toJson() => {'email': email};
}
