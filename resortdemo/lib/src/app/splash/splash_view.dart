import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/home/constants_home.dart';
import 'package:resortdemo/src/app/splash/splash_controller.dart';

import '../../data/data_user_repository.dart';

class SplashView extends View {
  static const routeName = '/splash';

  SplashView({Key? key}) : super(key: key); //todo: what is this

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _SplashViewState(
        SplashController(
          DataUserRepository(),
        ),
      );
}

class _SplashViewState extends ViewState<SplashView, SplashController> {
  _SplashViewState(SplashController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      key: globalKey,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Longevity\n   InTime',
              style: TextStyle(
                color: Color(0xff3683FC),
                fontFamily: 'Poppins',
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ControlledWidgetBuilder<SplashController>(
                builder: (context, controller) {
              return AnimatedOpacity(
                opacity: controller.animatedOpacityValue,
                duration: const Duration(seconds: 1),
                child: SizedBox(
                    width: size.width * 0.6,
                    child:
                        Image.asset("assets/images/Longevity_inTimesvg.png")),
              );
            }),
          ],
        ),
      ),
    );
  }
}
