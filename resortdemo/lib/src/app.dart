import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resortdemo/src/app/splash/splash_view.dart';

import 'app/home/home_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        SplashView.routeName: (ctx) => SplashView(),
        HomeView.routeName: (ctx) => HomeView(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins', //todo: convert to DmSans
      ),
    );
  }
}
