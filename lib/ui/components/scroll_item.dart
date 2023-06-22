import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScrollItem extends StatelessWidget {
  String imgUrl;
  String restaurant;
  String address;
  double distance;
  String foodType;

  ScrollItem({
    Key? key,
    required this.imgUrl,
    required this.restaurant,
    required this.address,
    required this.distance,
    required this.foodType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/detail');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1, // 퍼지는 범위
                    blurRadius: 10, // 흐림 효과
                    offset: const Offset(0, 3), // 그림자 위치
                  )
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              restaurant,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                            const Text('4.5'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.where_to_vote,
                              color: Colors.grey,
                              size: 14,
                            ),
                            Text(' $address'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Text('11.1km'),
                            const Text('  • 💵 💵 💵 •  '),
                            Text(foodType),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
