abstract class AuthenticationRepository {
  Future<void> startAuthentication(String email, String password);
  Future<void> startRegistration(
      String email, String password, String name, String lastName);
}
