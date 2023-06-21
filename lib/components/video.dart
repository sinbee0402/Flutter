import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  String videoImgUrl;
  String time;
  String userImgUrl;
  String title;
  String text;

  Video(this.videoImgUrl, this.time, this.userImgUrl, this.title, this.text,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              videoImgUrl,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black45),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          color: Colors.black,
          child: Row(
            children: [
              Image.network(
                userImgUrl,
                fit: BoxFit.contain,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
        )
      ],
    );
  }
}
