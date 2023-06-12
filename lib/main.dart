import 'package:flutter/material.dart';
import 'package:hello_flutter/ios_style_screen.dart';
import 'package:hello_flutter/main_page.dart';
// 다른 파일에 있는 클래스를 쓰기 위해서는 import를 해야한다.
// StatelessWidget은 플러터 자체적으로 제공하는 것이다. (material.dart를 써야한다.)
// Alt + enter로 선택해서 사용하면 된다.

// 함수, 플러터를 시작하는 부분
void main() {
  // Material 안에 있는 함수, 앱이 동작을 시작하는 부분.
  // 건드릴 일이 없다. 삭제가 되면 실행할 수 없다.
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
    // Material 디자인을 기본으로 가지고있는 앱을 만들 때,
    // 가장 처음에 위치해야하는 위젯
    // 이부분은 손대지 않고, home부분만 수정해서 사용한다.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 전체적인 색상이 바뀐다.
        // 안되는 색상들이 정해져 있다. -> white, black 등등
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const IosStyleScreen(), // 시작하는 파일, 첫번째 페이지
    );
  }
}
