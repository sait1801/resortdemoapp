import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/constants_home.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';
import 'package:resortdemo/src/app/home/widgets/primary_button.dart';

Widget villaDetailPage(HomeController controller, Size size) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      //todo: is this the best or only description part ?
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 3,
              ),
              Text(
                controller.selectedVillaName!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              Icon(
                Icons.pin_drop_outlined,
              ),
              Text(
                "Maldives, Funadhooviligilla,Gaafu Alif",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black45,
                ),
              ),
            ], //todo: addresses may change so this will change too
          ),
          const SizedBox(
            height: 20,
          ),
          amenities(),
          const SizedBox(height: 15),
          villaDetails(),
          const SizedBox(
            height: 15,
          ),
          amenityDetails(),
          const SizedBox(
            height: 15,
          ),
          primaryButton(
            kPrimaryColor,
            Colors.white,
            () => print("Hello"),
            "Book Now",
            null,
            size,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}

Widget amenities() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.black),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3,
        )
      ],
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 3,
            ),
            amenityCard(Icons.villa_outlined, 'Type', 'Entire Place'),
            amenityCard(Icons.person_rounded, 'Accomodation', '2 Guests'),
            amenityCard(Icons.wb_sunny_outlined, 'Longetivy', 'Mild Climate'),
            amenityCard(Icons.note_alt_outlined, 'Treatment',
                'Patent Pending\n      Concept'),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget amenityCard(IconData icon, String name, String text) {
  return Column(
    children: [
      Icon(icon),
      const SizedBox(
        height: 3,
      ),
      Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
      const SizedBox(
        height: 3,
      ),
      Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 9),
      ),
    ],
  );
}

Widget villaDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Description",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      const SizedBox(
        height: 3,
      ),
      RichText(
        text: const TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.black45,
            ),
            text:
                "Consortium reveals plans to build dedicated personalized longevity resort on Maldives island.\nNo, it’s not a concept for a new TV reality show — a small island in the Maldives could soon become home to an exclusive resort, \nwhere well-heeled individuals and their families can access the latest in longevity treatments.\nA consortium of longevity-focused business people,\nscientists and clinicians plans to turn the uninhabited island in the Maldives archipelago into the first in a network of \n«Longevity Scientific Resorts."),
        maxLines: 10,
      ),
    ],
  );
}

Widget amenityDetails() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.black),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 3,
              ),
              amenityDetailColumn([
                "Tracking 30 days before stay & lifetime after stay",
                "Longevity treatments conducted by leading scientists",
                "Nutrition plan designed by leading longevity scientists"
              ]),
              amenityDetailColumn([
                "Access only to designated customers",
                "Longevity clinical trials for selected clients",
                "30 days + stay in an over-water villa "
              ]),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget amenityDetailColumn(List<String> amenities) {
  return Column(
    children: [
      for (String text in amenities)
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellowAccent,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 9,
                color: Colors.black87,
              ),
            )
          ],
        ),
    ],
  );
}
