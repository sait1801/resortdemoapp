import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/widgets/service_popup.dart';

Widget servicesListView(Size size, BuildContext context) {
  List<String> serviceNames = [
    "Fitness & Spa",
    "Balanced Nutrition\n Plan",
    "Health Tracking",
    "Clinical Treatments",
    "Intellectual\n Development",
    "Social Recognition",
  ];
  List<IconData> icons = [
    Icons.spa,
    Icons.food_bank,
    Icons.health_and_safety,
    Icons.healing,
    Icons.psychology,
    Icons.group,
  ];
  return SizedBox(
    height: 100,
    width: size.width,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: serviceNames.length,
        itemBuilder: (context, index) => Row(
          children: [
            servicesCard(icons[index], serviceNames[index], context),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    ),
  );
}

Widget servicesCard(IconData icon, String text, BuildContext context) {
  return GestureDetector(
    onTap: () => ServicePopup(context: context, text: text).showCustomPopUp(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 9)
              ]),
          width: 60,
          height: 60,
          child: Icon(
            icon,
            color: const Color(0xff73c0c8),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          textAlign: TextAlign.justify,
          maxLines: 2,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}
