import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/widgets/primary_button.dart';
import 'package:resortdemo/src/app/profile/profile_controller.dart';
import 'package:resortdemo/src/domain/entities/reservation.dart';

Widget reservationCard(Reservation reservation, Size size,
    ProfileController controller, BuildContext context) {
  return Container(
    width: size.width * 0.8,
    height: size.height * 0.3,
    decoration: BoxDecoration(
      color: Colors.white70,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.black45),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 9,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: size.height * 0.19,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            primaryButton(
              Colors.green,
              Colors.white,
              () {
                controller.changeDate(context, size, GlobalKey(), reservation);
              },
              "Update",
              Colors.black38,
              size,
              customWidth: 100,
            ),
            primaryButton(
              Colors.red,
              Colors.white,
              () {
                controller.cancelReservation(reservation.id);
              },
              "Cancel",
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
