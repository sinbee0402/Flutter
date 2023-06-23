import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void initState() {
    //생명주기 - 시작을 할 때
    super.initState();

    load();
  }

  @override
  void dispose() {
    //생명주기 - 종료가 될 때
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));
  }

  Future load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');

    if (height != null && weight != null) {
      _heightController.text = '$height';
      _weightController.text = '$weight';
      print('키 : $height, 몸무게 : $weight');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 잘못된 const 사용으로 Scaffold 이하 코드에서 에러가 발생.
    // Scaffold 내부에 _formKey라는 변수를 사용했으므로 const(상수)를 주면 안된다.
    // const Scaffold => Scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text('비만도 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '키를 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '몸무게를 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }

                  save();

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ResultScreen(
                  //       height: double.parse(_heightController.text),
                  //       weight: double.parse(_weightController.text),
                  //     ),
                  //   ),
                  // );

                  // Uri를 호출안하면 queryParameters 자체가 안나온다.
                  context.push(Uri(
                    path: '/main/result',
                    queryParameters: {
                      'height': _heightController.text,
                      'weight': _weightController.text,
                    },
                  ).toString());
                },
                child: const Text('결과'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
