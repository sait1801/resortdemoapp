import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget servicesListView(Size size) {
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
            servicesCard(icons[index], serviceNames[index]),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    ),
  );
}

Widget servicesCard(IconData icon, String text) {
  return GestureDetector(
    onTap: () => print(text),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 12)
              ]),
          width: 60,
          height: 60,
          child: Icon(icon),
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
