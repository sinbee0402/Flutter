import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomDetailAppbar extends StatelessWidget {
  String imgUrl;

  CustomDetailAppbar({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                const SizedBox(width: 32),
                CustomText(
                    smallText: 'Bring order to',
                    bigText: 'NY, 201-279 W 42nd St'),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
