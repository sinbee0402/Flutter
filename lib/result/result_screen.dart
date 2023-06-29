import 'package:bmi_calculator/result/result_view_model.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({
    Key? key,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = ResultViewModel();
    final bmi = weight / ((height / 100.0) * (height / 100.0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.getBmiResult(bmi),
              style: const TextStyle(fontSize: 36),
            ),
            viewModel.getBmiIcon(bmi)
          ],
        ),
      ),
    );
  }
}
