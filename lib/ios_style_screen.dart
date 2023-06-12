import 'package:flutter/cupertino.dart';

// IOS 디자인 사용 - Cupertino
// 사용 방법이 완전히 다르다.

class IosStyleScreen extends StatefulWidget {
  const IosStyleScreen({Key? key}) : super(key: key);

  @override
  State<IosStyleScreen> createState() => _IosStyleScreenState();
}

class _IosStyleScreenState extends State<IosStyleScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      // Parameter Info : Ctrl + P
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('쿠퍼티노 앱'),
        ),
        child: Center(
          child: Text('쿠퍼티노 앱'),
        ),
      ),
    );
  }
}
