import 'dart:io';

// 06.01.과제
// 파일 복사

void copy(String source, String target) {
  final file = File('lib/homework/file_copy/$source');
  final copyFile = File('lib/homework/file_copy/$target');

  copyFile.writeAsStringSync(file.readAsStringSync());
  // copyFile.writeAsStringSync(file.readAsStringSync(), mode: FileMode.append);
}

void main() {
  try {
    copy('memo.txt', 'copy.txt');
  } catch (e) {
    print('파일 경로가 잘못되었습니다.');
  }
}
