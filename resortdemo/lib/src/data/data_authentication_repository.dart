import 'package:firebase_auth/firebase_auth.dart';
import 'package:resortdemo/src/domain/repositories/authentication_repository.dart';

class DataAuthenticationRepository implements AuthenticationRepository {
  static final _instance = DataAuthenticationRepository._internal();

  DataAuthenticationRepository._internal();

  factory DataAuthenticationRepository() => _instance;

  static final _firebaseAuth = FirebaseAuth.instance;

  late String _verificationId;

  @override
  Future<void> startAuthentication(String email, String password) async {
    try {
      email = email;
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> startRegistraion(String email, String password) async {
    try {
      email = email;
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
