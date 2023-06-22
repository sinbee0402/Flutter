import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomMainAppbar extends StatelessWidget {
  const CustomMainAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Color(0xff6B69C7),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/user.jpeg'),
                      ),
                    ),
                    Text(
                      'user 1234',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 32),
                    CustomText(
                        smallText: 'Bring order to',
                        bigText: 'NY, 201-279 W 42nd St'),
                    const SizedBox(width: 20.0),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.white70,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child:
                            CustomText(smallText: 'When?', bigText: '10-11 pm'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 8,
              top: 24,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.blur_on,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
