import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget villasListView(Size size) {
  List<String> imagePaths = [
    "https://pix10.agoda.net/hotelImages/165/165225/165225_15122916570038787834.jpg?ca=6&ce=1&s=1024x768",
    "https://glitterrebel.com/wp-content/uploads/2019/12/HERO-IMAGE-best-underwater-hotels-in-the-world.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/22/08/0b/89/exterior.jpg",
  ];

  List<String> names = [
    "Onwater Villa",
    "Underwater Bedroom",
    "Weekend Apartments",
  ];
  return SizedBox(
    height: 200,
    width: size.width,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Row(
          children: [
            villaCard(imagePaths[index], names[index], (index == 3), size),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    ),
  );
}

Widget villaCard(String imagePath, String name, bool isUpcoming, Size size) {
  return GestureDetector(
    onTap: () => print("BUraya Bakarlar"),
    child: Container(
      width: (size.width - 70) / 3,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 9,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(imagePath),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
