import 'package:clone_food_delivery/ui/components/custom_detail_appbar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  String imgUrl;

  DetailScreen({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(240.0),
        child: Hero(
          tag: 'detail_app_bar',
          child: CustomDetailAppbar(imgUrl: imgUrl),
        ),
      ),
    );
  }
}
