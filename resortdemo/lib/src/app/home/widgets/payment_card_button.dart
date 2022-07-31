import 'package:flutter/material.dart';

Widget paymentCardButon(Size size, {required String imagePath}) {
  return Container(
    height: 45,
    width: size.width * 0.7,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Colors.white70,
    ),
    child: TextButton(
      style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0))),
      onPressed: () => print("selected payment method"),
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    ),
  );
}
