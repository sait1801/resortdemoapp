import 'package:flutter/material.dart';

class PrimaryPopup {
  final BuildContext context;
  final String title;
  final String content;

  final Size size;

  PrimaryPopup({
    required this.context,
    required this.title,
    required this.content,
  }) : this.size = MediaQuery.of(context).size;

  Future<void> showDefaultPopup() async {
    await showDialog(
      context: this.context,
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.black.withOpacity(0.675),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.message_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(width: 23),
                Container(
                  width: size.width - 185,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        this.content,
                        style: const TextStyle(
                          color: Color(0xffD1D1D1),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        width: size.width * 0.52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Okay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showCustomPopup(IconData icon, List<Widget> actions) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black.withOpacity(0.675),
              ),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(width: 23),
                  Container(
                    width: size.width - 185,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          this.content,
                          style: const TextStyle(
                            color: const Color(0xffD1D1D1),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: size.width * 0.52,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              actions[0],
                              actions.length > 1 ? actions[1] : Container(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
