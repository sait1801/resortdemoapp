import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ServicePopup {
  final BuildContext context;
  final String text;

  ServicePopup({required this.context, required this.text});

  Future<void> showCustomPopUp() async {
    late String gifUrl;
    switch (text) {
      case 'Fitness & Spa':
        gifUrl = 'assets/animations/spa_fitness.gif';
        break;
      case 'Balanced Nutrition\n Plan':
        gifUrl = 'assets/animations/nutirition.gif';
        break;
      case 'Health Tracking':
        gifUrl = 'assets/animations/health_tracking.gif';
        break;
      case 'Clinical Treatments':
        gifUrl = 'assets/animations/clinical_treatment.gif';
        break;
      case 'Intellectual\n Development':
        gifUrl = 'assets/animations/intellectual_development.gif';
        break;

      default:
        gifUrl = 'assets/animations/social_recognition.gif';
    }
    await Alert(
        context: context,
        title: text,
        content: Column(
          children: <Widget>[
            Image.asset(gifUrl),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce auctor enim a fringilla scelerisque. Quisque sollicitudin ante et nisl dictum, in porttitor leo gravida. Duis eu magna tincidunt, feugiat mi et, laoreet tortor. Sed tempor, arcu eget auctor semper, ex.',
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "OKAY",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ]).show();
  }
}
