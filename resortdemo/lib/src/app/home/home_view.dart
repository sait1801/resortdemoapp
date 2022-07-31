import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/home/constants_home.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';
import 'package:resortdemo/src/app/home/widgets/animated_container.dart';
import 'package:resortdemo/src/app/home/widgets/bottom_nav_bar.dart';
import 'package:resortdemo/src/app/home/widgets/services.dart';
import 'package:resortdemo/src/app/home/widgets/top_image.dart';
import 'package:resortdemo/src/data/data_reservation_repository.dart';

class HomeView extends View {
  static const routeName = '/homeView';
  @override
  // ignore: no_logic_in_create_state
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

  late TabController _tabController;

  @override
  // ignore: invalid_override_of_non_virtual_member
  void initState() {
    super.initState();
    _tabController = TabController(
      animationDuration: const Duration(milliseconds: 300),
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundColor,
      bottomNavigationBar: ControlledWidgetBuilder<HomeController>(
          builder: (context, controller) {
        return bottomNavBar(_tabController, context, 1);
      }),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                height: size.height * 0.4,
                width: size.width,
                child: ControlledWidgetBuilder<HomeController>(
                  builder: (context, controller) => topImage(controller, size),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: ControlledWidgetBuilder<HomeController>(
                builder: (context, controller) => animatedContainer(
                  controller,
                  size,
                  globalKey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
