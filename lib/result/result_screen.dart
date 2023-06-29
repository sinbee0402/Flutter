import 'package:bmi_calculator/result/result_view_model.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  ResultScreen({
    Key? key,
    required this.height,
    required this.weight,
  })  : viewModel = ResultViewModel(height: height, weight: weight),
        super(key: key);

  final ResultViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.getBmiResult(),
              style: const TextStyle(fontSize: 36),
            ),
            viewModel.getBmiIcon()
          ],
        ),
      ),
    );
  }
}
