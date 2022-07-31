import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/widgets/primary_button.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';

Widget reservationCard(Reservation reservation, Size size) {
  return Container(
    width: size.width * 0.8,
    height: size.height * 0.3,
    decoration: BoxDecoration(
      color: Colors.white70,
      borderRadius: BorderRadius.circular(30),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 9,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: size.height * 0.20,
          width: (size.width * 0.8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                getImgUrl(reservation.villaType),
              ),
            ),
          ),
        ),
        Text(
          'Start Date: ${reservation.startDate.day.toString()}.${reservation.startDate.month.toString()}.${reservation.startDate.year.toString()} - End Date: ${reservation.endDate.day.toString()}.${reservation.endDate.month.toString()}.${reservation.endDate.year.toString()}',
        ),
        Row(
          children: [
            primaryButton(
              Colors.greenAccent,
              Colors.white,
              () {},
              "Update Reservation",
              Colors.black38,
              size,
              customWidth: 100,
            )
          ],
        ),
      ]),
    ),
  );
}

String getImgUrl(VillaType villaType) {
  switch (villaType) {
    case VillaType.ONWATERRESORT:
      return 'assets/images/random1.jpg';

    case VillaType.APARTMENT:
      return 'assets/images/random2.jpg';

    case VillaType.UNDERWATERBEDROOM:
      return 'assets/images/random3.png';

    default:
      return 'assets/images/random3.png';
  }
}
