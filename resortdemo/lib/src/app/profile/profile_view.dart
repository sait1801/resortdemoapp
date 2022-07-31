import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/home/constants_home.dart';
import 'package:resortdemo/src/app/home/widgets/bottom_nav_bar.dart';
import 'package:resortdemo/src/app/profile/profile_controller.dart';
import 'package:resortdemo/src/app/profile/widgets/reservation_card.dart';
import 'package:resortdemo/src/data/data_reservation_repository.dart';

class ProfileView extends View {
  static const routeName = '/profileView';

  ProfileView({Key? key}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _ProfileViewState(
        ProfileController(
          DataReservationRepository(),
        ),
      );
}

class _ProfileViewState extends ViewState<ProfileView, ProfileController>
    with TickerProviderStateMixin {
  _ProfileViewState(
    ProfileController profileController,
  ) : super(profileController);

  late TabController _tabController;

  @override
  // ignore: invalid_override_of_non_virtual_member
  void initState() {
    super.initState();
    _tabController = TabController(
      animationDuration: const Duration(milliseconds: 500),
      initialIndex: 2,
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
      bottomNavigationBar: ControlledWidgetBuilder<ProfileController>(
          builder: (context, controller) {
        return bottomNavBar(_tabController, context, 2);
      }),
      body: SafeArea(
        child: ControlledWidgetBuilder<ProfileController>(
            builder: (context, controller) {
          return ListView.builder(
            itemCount: controller.reservations == null
                ? 0
                : controller.reservations.length,
            itemBuilder: ((context, index) => SingleChildScrollView(
                  child: Column(
                    children: [
                      reservationCard(controller.reservations[index], size,
                          controller, context),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                )),
          );
        }),
      ),
    );
  }
}
