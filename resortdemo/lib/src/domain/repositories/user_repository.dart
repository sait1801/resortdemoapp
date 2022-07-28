import '../entities/user.dart';

abstract class UserRepository {
  Future<bool> checkIfUserOnFirestore(String email);
  Future<bool> get isUserLoggedIn;
  Future<void> initalizeUserRepository();
  Future<void> signInAnonymously();
  User get currentUser;
}
