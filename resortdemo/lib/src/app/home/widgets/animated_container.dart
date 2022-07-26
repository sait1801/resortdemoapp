import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/constants_home.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/home/widgets/services.dart';
import 'package:resortdemo/src/app/home/widgets/villa_detail_screen.dart';
import 'package:resortdemo/src/app/home/widgets/villas.dart';

Widget animatedContainer(HomeController controller, Size size, Key globalKey) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    curve: Curves.ease,
    width: size.width,
    height: controller.isVillaDetails
        ? size.height * 0.60
        : size.height *
            0.50, //todo: this part must be 0.6 but IDK why there is a problem
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      color: kLightBackgroundColor,
      boxShadow: [
        BoxShadow(
          offset: Offset(
            0,
            -5,
          ),
          color: Colors.black12,
          blurRadius: 10,
          spreadRadius: 5,
        ),
      ],
    ),
    child:
        ControlledWidgetBuilder<HomeController>(builder: (context, controller) {
      return controller.isVillaDetails
          ? PageView(
              //todo: no need for pageview actually but can be userd for more effective page designs
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                villaDetailPage(controller),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Text(
                        'Services',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    servicesListView(size, context),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Villa Types',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    villasListView(size, controller),
                  ],
                ),
              ],
            );
    }),
  );
}
