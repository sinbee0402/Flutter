import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget / StatefulWidget
// Widget : 화면에 그릴 수 있는 모든 것들. text. button. action_bar.
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
      home: const MyHomePage(),
    );
  }
}

// stful : 새로운 stateful widget을 만드는 코드.
//
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 화면에 X 표시
    // return const Placeholder();
    // 화면의 빈 공간을 나타냄.
    // 둘의 차이는 X자 표시를 나타내느냐 아니냐의 차이이다.

    // 흰색 화면 만들기
    // Scaffold : 앱을 만드는 기본이 되는 뼈대 위젯.
    // 대부분의 경우 항상 사용한다.
    return Scaffold(
      // AppBar 만들기
      appBar: AppBar(
        // AppBar의 텍스트(타이틀)
        // Text를 사용해서 문자를 작성할 때, 작은 따옴표가 기본이다.
        title: Text('홈'),
      ),
      body: Center(
        child: Text(
          '0',
          style: TextStyle(
            color: Colors.red,
            fontSize: 70,
          ),
          // Reformat Code : Ctrl + Alt + L / option + L
          // 속성들이 많이 사용이 되는 경우에 사용한다.
          // Reformat이 되는 경우는
          // 마지막 속성에 ,(컴마)가 있는 경우 줄이 바뀌면서 정리가 되고,
          // ,(컴마)가 없는 경우 한줄로 정리가 된다.
        ),
      ),
    );
  }
}
