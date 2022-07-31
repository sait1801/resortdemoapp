import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resortdemo/src/data/data_user_repository.dart';
import 'package:resortdemo/src/domain/entities/user.dart' as userEnt;
import 'package:resortdemo/src/domain/repositories/authentication_repository.dart';

class DataAuthenticationRepository implements AuthenticationRepository {
  static final _instance = DataAuthenticationRepository._internal();

  DataAuthenticationRepository._internal();

  factory DataAuthenticationRepository() => _instance;

  static final _firebaseAuth = FirebaseAuth.instance;

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference userReferance =
      FirebaseFirestore.instance.collection("users");

  late String? userId;
  late UserCredential userCredential;

  @override
  Future<void> startAuthentication(String email, String password) async {
    try {
      print("Start Auth");
      email = email;
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      this.userId = userCredential.additionalUserInfo!.username;
    } on FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> startRegistration(
      String email, String password, String name, String lastName) async {
    try {
      print("Start Registration");
      email = email;
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //todo: null is given
      userEnt.User user = userEnt.User(name, lastName, email, password, []);

      userId = userCredential.additionalUserInfo!.username;

      await userReferance.doc(userId).set(user.toMap(user, password));
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
