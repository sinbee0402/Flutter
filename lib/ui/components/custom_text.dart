import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String smallText;
  String bigText;

  CustomText({
    Key? key,
    required this.smallText,
    required this.bigText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          smallText,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          bigText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
