import 'package:bmi_calculator/main/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final viewModel = MainViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.load();
  }

  @override
  void dispose() {
    viewModel.heightController.dispose();
    viewModel.weightController.dispose();
    super.dispose();
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
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: viewModel.heightController,
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
                controller: viewModel.weightController,
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
                  if (viewModel.formKey.currentState?.validate() == false) {
                    return;
                  }

                  viewModel.save();

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ResultScreen(
                  //       height: double.parse(_heightController.text),
                  //       weight: double.parse(_weightController.text),
                  //     ),
                  //   ),
                  // );

                  //얘네는 viewModel에 넣지 않는다. 넣으면 안티패턴
                  // Uri를 호출안하면 queryParameters 자체가 안나온다.
                  context.push(Uri(
                    path: '/main/result',
                    queryParameters: {
                      'height': viewModel.heightController.text,
                      'weight': viewModel.weightController.text,
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
