import 'package:flutter/material.dart';

class ResultViewModel {
  final double height;
  final double weight;

  ResultViewModel({required this.height, required this.weight});

  String getBmiResult() {
    final bmi = weight / ((height / 100.0) * (height / 100.0));
    String result = '저체중';
    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  Icon getBmiIcon() {
    final bmi = weight / ((height / 100.0) * (height / 100.0));
    Icon icon = const Icon(
      Icons.sentiment_dissatisfied,
      color: Colors.blue,
      size: 100,
    );
    if (bmi >= 25) {
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    } else if (bmi >= 23) {
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.orange,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      icon = const Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    }
    return icon;
  }
}
