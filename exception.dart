// 06.01.과제

void main() {
  final numString = '10.5';
  int num;

  try {
    // Exception 발생
    num = int.parse(numString);
  } catch (e) {
    // e: Exception 발생 error
    num = 0;
    print(num);
  }
}
