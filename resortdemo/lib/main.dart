import 'package:flutter/material.dart';
import 'package:resortdemo/src/app.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(App());
}
