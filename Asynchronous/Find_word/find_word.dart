import 'dart:io';

// 06.07.과제
// 1번. 파일 처리

void main() async {
  await findWord('sample.csv')
      .catchError((e) => print('오류 발생: $e'), test: (e) => e is Exception);
  // test 값은 예외를 처리할지 여부 결정, bool값
  // true: Exception일 때, false: pass
  print('작업 완료');
}

Future<String> findWord(String path) async {
  try {
    final word = await File('lib/homework/Asynchronous/$path').readAsString();
    final copyWord = File('lib/homework/Asynchronous/sample_copy.csv');
    if (word.contains('한석봉')) {
      copyWord.writeAsString(word.replaceAll('한', '김'));
    }
  } catch (e) {
    await Future.error(Exception('파일을 찾을 수 없습니다.'));
  }
  return '에러 통과';
}
