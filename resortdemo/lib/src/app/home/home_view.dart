import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/home/constants_home.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';
import 'package:resortdemo/src/app/home/widgets/bottom_nav_bar.dart';
import 'package:resortdemo/src/data/data_reservation_repository.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeView extends View {
  static const routeName = '/homeView';
  @override
  State<StatefulWidget> createState() => _HomeViewState(
        HomeController(
          DataReservationRepository(),
        ),
      );
}

class _HomeViewState extends ViewState<HomeView, HomeController>
    with TickerProviderStateMixin {
  _HomeViewState(
    HomeController homeController,
  ) : super(homeController);

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      backgroundColor: backGroundColor,
      bottomNavigationBar: ControlledWidgetBuilder<HomeController>(
          builder: (context, controller) {
        return bottomNavBar(controller);
      }),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
        ),
      ),
    );
  }
}
