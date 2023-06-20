import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SensorApp(),
    );
  }
}

class SensorApp extends StatelessWidget {
  const SensorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 가운데 좌표에서 Container의 크기 절반인 50을 빼준다.
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: centerX,
            top: centerY,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color의 중복 사용은 불가능하다.
                // BoxDecoration을 사용한다면 해당 위젯에서 사용하는 게 맞다.
                color: Colors.green,
              ),
              // 크기 값을 설정해주지 않으면, 기본적으로 꽉 찬다.
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
