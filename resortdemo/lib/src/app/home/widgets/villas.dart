import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resortdemo/src/app/home/home_controller.dart';

Widget villasListView(Size size, HomeController controller) {
  List<String> imagePaths = [
    "assets/images/onwater_villa.jpg",
    "assets/images/underwater_bed.jpg",
    "assets/images/weekend_apartment.jpg",
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
            villaCard(imagePaths[index], names[index], (index == 3), size,
                controller),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    ),
  );
}

Widget villaCard(String imagePath, String name, bool isUpcoming, Size size,
    HomeController controller) {
  return GestureDetector(
    onTap: () {
      controller.topImagePath = imagePath;
      controller.isVillaDetails = true;
      controller.selectedVillaName = name;
      controller.selectedVillaDescription =
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In convallis dictum lectus, in gravida nibh pretium id. Mauris sit amet ultrices nulla. Nunc id neque et velit fermentum faucibus. Phasellus suscipit nibh non leo congue, sed accumsan sem vulputate. Quisque pellentesque vehicula mollis. Quisque sit amet urna ut dolor sodales sagittis. Curabitur in dui vitae nisi laoreet suscipit. In hac habitasse platea dictumst.";

      controller.refreshScreeen();
    },
    child: Container(
      width: (size.width - 60) / 3,
      height: 160,
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
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 110,
              width: (size.width - 50) / 3 - 30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Hero(tag: imagePath, child: Image.asset(imagePath)),
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
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
