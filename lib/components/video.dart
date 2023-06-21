import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  final String videoImgUrl;
  final String time;
  final String userImgUrl;
  final String title;
  final String text;

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
                width: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black45),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 72,
          child: Stack(
            children: [
              Container(
                color: Colors.black,
                child: Row(
                  children: [
                    Image.network(
                      userImgUrl,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 272,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
