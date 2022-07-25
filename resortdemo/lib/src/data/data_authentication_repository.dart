import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:resortdemo/src/domain/repositories/authentication_repository.dart';

class DataAuthenticationRepository implements AuthenticationRepository {
  static final _instance = DataAuthenticationRepository._internal();
  DataAuthenticationRepository._internal();
  factory DataAuthenticationRepository() => _instance;

  UserCredential? user;

  @override
  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();

      user = userCredential;
    } catch (e) {
      print(e);
      print("Error at DataAuthRepo");
      rethrow;
    }
  }
}
