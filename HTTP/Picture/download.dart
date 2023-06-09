import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

// 06.08.과제

void main() async {
  // 4번.
  print('다운로드 시작');
  Stopwatch stopwatch = Stopwatch()..start();

  // 3번.
  final file = await saveFile(
    await downloadImage('https://alimipro.com/favicon.ico'),
    'icon.ico',
  );

  // 4번.
  stopwatch.stop();
  print('다운로드 끝');
  print('===============');
  print('소요 시간 : ${stopwatch.elapsed}');
  print('용량 : ${await file.length()}bytes');
  
  // 5번.
  await downloadSequence();
  await downloadParallel();

  // 6번. 
  await saveFile(
    await downloadImage('https://asdfasdfasdf/favicon.ico2'),
    'icon.ico',
  );
}

// 3번.
// 함수를 끝까지 작성해야 type을 import 할 수 있다.
Future<Uint8List> downloadImage(String url) async {
  // 6번. throw Exception을 쓰려면 어떻게 해야하지..?
  try {
    final response = await http.get(Uri.parse(url));
    return response.bodyBytes;
    // bodyBytes: HTTP 응답의 데이터를 바이트 배열 형태로 나타낸다.
    // 바이트 배열은 메모리에 저장된 이미지, 파일, 텍스트 등 다양한 데이터를 포함할 수 있다.
  } catch (e) {
    // 대체 데이터
    print('url 주소가 잘못되었습니다.');
    print('대체 데이터를 제공합니다.');
    url =
        'https://blog.kakaocdn.net/dn/I3uVW/btsfCsG5Lol/NSKMEyEIqYBQSbiFbcskcK/img.png';
    final response = await http.get(Uri.parse(url));
    return response.bodyBytes;
    // throw Exception('url 주소가 잘못되었습니다.');
  }
}

// 3번.
Future<File> saveFile(Uint8List bytes, String fileName) async {
  final file = File('lib/homework/HTTP/Picture/$fileName');
  return await file.writeAsBytes(bytes);
  // writeAsBytes: 바이트 배열 데이터를 파일로 저장하는 메서드
  // 해당 파일이 생성되거나 기존 파일이 덮어쓰여진다.
}

// 5번.
// 순서
Future<void> downloadSequence() async {
  Stopwatch stopwatch = Stopwatch()..start();
  for (int i = 1; i < 4; i++) {
    await saveFile(
        await downloadImage('https://alimipro.com/favicon.ico'), 'icon$i.ico');
  }
  stopwatch.stop();
  print('소요 시간 : ${stopwatch.elapsed}');
}

// 5번.
// 병렬
Future<void> downloadParallel() async {
  final futures = [
    saveFile(
        await downloadImage('https://alimipro.com/favicon.ico'), 'icon4.ico'),
    saveFile(
        await downloadImage('https://alimipro.com/favicon.ico'), 'icon5.ico'),
    saveFile(
        await downloadImage('https://alimipro.com/favicon.ico'), 'icon6.ico'),
  ]; // wait을 사용하기 위해서는 List안에서 await를 호출하면 안된다..?
  Stopwatch stopwatch = Stopwatch()..start();

  await Future.wait(futures);

  stopwatch.stop();
  print('소요 시간 : ${stopwatch.elapsed}');
}
