class UserDisabledFromAuthenticationException implements Exception {
  final String message;
  UserDisabledFromAuthenticationException(this.message);
}
