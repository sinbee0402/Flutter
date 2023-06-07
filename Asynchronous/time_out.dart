// 06.07.과제
// 3번

void main() async {
  final result = await timeoutFuture()
      .timeout(Duration(seconds: 5), onTimeout: () => 'timeout');
  print(result);
}

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}
