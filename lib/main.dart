import 'package:flutter/material.dart';
import 'package:hello_flutter/main_page.dart';
// 다른 파일에 있는 클래스를 쓰기 위해서는 import를 해야한다.
// StatelessWidget은 플러터 자체적으로 제공하는 것이다. (material.dart를 써야한다.)
// Alt + enter로 선택해서 사용하면 된다.

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
