import 'package:flutter/cupertino.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';

Widget villaDetailPage(HomeController controller) {
  return Column(
    children: [
      Text(
        controller.selectedVillaName!,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ],
  );
}
