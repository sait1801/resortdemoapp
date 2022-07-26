import 'package:flutter/material.dart';

Widget primaryButton(Color buttonColor, Color textColor, Function onPressed,
    String text, Color? borderColor, Size size,
    {String? icon, double? customWidth}) {
  return Container(
    height: 45,
    width: customWidth ?? size.width,
    margin: const EdgeInsets.symmetric(horizontal: 13),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: buttonColor,
      border: borderColor == null ? null : Border.all(color: borderColor),
    ),
    child: TextButton(
      onPressed: () => onPressed(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == null
              ? Container()
              : Row(
                  children: [
                    Image.asset(icon),
                    const SizedBox(
                      width: 15,
                    )
                  ],
                ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}
