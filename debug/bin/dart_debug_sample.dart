import 'package:dart_debug_sample/dart_debug_sample.dart' as dart_debug_sample;
import 'package:dart_debug_sample/dart_debug_sample.dart';

void main() {
  YukymController yukymController = YukymController();
  print(yukymController.getTyA()); // 해당 월에 맞는 자시의 국 표시 - clear
  print(yukymController.getTyB()); // 해당 시간에 맞는 자시의 국 표시 - clear
}
