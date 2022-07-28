import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/repositories/user_repository.dart';

import '../domain/entities/user.dart' as userEnt;

class DataUserRepository implements UserRepository {
  static final _instance = DataUserRepository._internal();

  DataUserRepository._internal();

  factory DataUserRepository() => _instance;

  static final _firebaseAuth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;
  late userEnt.User _currentUser;

  @override
  Future<bool> get isUserLoggedIn async {
    try {
      await _firebaseAuth.currentUser?.reload();
      return _firebaseAuth.currentUser == null ? false : true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        throw Exception(['User Disabled']);
      } else if (e.code == 'user-not-found') {
        throw Exception(['User not Found']);
      }

      rethrow;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<bool> checkIfUserOnFirestore(String email) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      print(querySnapshot.docs.first.data());

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data()['isActive'] == true
            ? true
            : false;
      }

      return false;
    } catch (e, st) {
      print(e);
      print(st);
      print('Error on checkIfUserOnFirestore');
      rethrow;
    }
  }

  @override
  Future<void> initalizeUserRepository() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: _firebaseAuth.currentUser!.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        userEnt.User user = userEnt.User.fromMap(
            querySnapshot.docs.first.data(), _firebaseAuth.currentUser!.uid);
        _currentUser = user;

        print("currentUser: $_currentUser");
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInAnonymously(); //todo: user assigning ?
    } catch (e) {
      print(e);
      print("Error at DataAuthRepo");
      rethrow;
    }
  }

  @override
  userEnt.User get currentUser => userEnt.User.fromUser(_currentUser);
}
