import 'package:firebase_auth/firebase_auth.dart';
import 'package:resortdemo/src/domain/repositories/authentication_repository.dart';

class DataAuthenticationRepository implements AuthenticationRepository {
  static final _instance = DataAuthenticationRepository._internal();

  DataAuthenticationRepository._internal();

  factory DataAuthenticationRepository() => _instance;

  static final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> startAuthentication(String email, String password) async {
    try {
      email = email;
      UserCredential userCredentials =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      await startRegistration(email, password);
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> startRegistration(String email, String password) async {
    try {
      print("HERE");
      email = email;
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
