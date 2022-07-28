class InvalidVerificationCodeException implements Exception {
  final String message;

  InvalidVerificationCodeException(this.message);
}
