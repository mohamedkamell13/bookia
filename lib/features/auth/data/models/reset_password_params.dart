class ResetPasswordParams {
  int? verifyCode;
  String? newPassword;
  String? newPasswordConfirmation;

  ResetPasswordParams({
    this.verifyCode,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  Map<String, dynamic> toJson() => {
    'verify_code': verifyCode,
    'new_password': newPassword,
    'new_password_confirmation': newPasswordConfirmation,
  };
}
