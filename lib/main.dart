import 'package:flutter/material.dart';
import 'package:hello_flutter/main_page.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget / StatefulWidget
// Widget : 화면에 그릴 수 있는 모든 것들. text. button. action_bar.

// 앱이 시작되는 부분
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
