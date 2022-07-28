abstract class AuthenticationRepository {
  Future<void> startAuthentication(String email, String password);
}
