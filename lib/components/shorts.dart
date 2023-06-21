import 'package:flutter/material.dart';

class Shorts extends StatelessWidget {
  String videoImgUrl;
  String title;
  String hits;

  Shorts(this.videoImgUrl, this.title, this.hits, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Container(
            width: 88,
            height: 144,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              videoImgUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: Text(
              '$title\n$hits',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          const Positioned(
            top: 5,
            right: 5,
            child: Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}
