import 'package:flutter/material.dart';
// stful : 새로운 stateful widget을 만드는 코드.

// 화면 부분
// 화면을 만들 때, 하나의 화면은 하나의 파일에만 만들 것.
// 앱이 시작되는 부분을 제외하고, 나머지 화면 부분들은 별도의 파일로 작성하는 것이 좋다.
// 파일을 나누는 이유는 나중에 수정할 때, 관리하기 용이하게 사용할 수 있기 때문이다.

// CamelCase (낙타형) : 대문자와 띄어쓰기 없이.
// snake_case (뱀형) : 소문자와 _(언더바)
// 둘다 띄어쓰기가 없다.
// class명은 CamelCase로, 파일명은 snake_case로 작성한다.
// 암묵적인 룰이다.
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  // 위 코드에서 Ctrl + B로 MainPage를 사용하는 부분으로 갈 수 있다.

  // 코드에서 값 검색하기 : Ctrl + F / cmd + F
  // 사용하고 있는 부분 띄우기 : Ctrl + B / cmd + B
  // 사용되고 있는 부분에서 Ctrl + B를 누르면 선언된 부분으로 돌아갈 수 있다.
  // 단축키로도 사용할 수 있다.
  // 최근에 사용했던 파일목록 : Ctrl + E / cmd + E

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 변수명은 소문자로 시작해야 한다.
  // count라는 변수에 값 0을 담음.
  int number = 0;
  // count -> number, MyHomePage -> MainPage, my_home_page -> main_page
  // 변수, 함수, 클래스 이름 한번에 변경하기
  // : Shift + F6 / 해당 변수, 함수, 클래스명 우클릭 Refactor -> Rename

  @override // 메서드와 함수도 소문자로 시작한다.
  Widget build(BuildContext context) {
    // 화면에 X 표시
    // return const Placeholder();
    // 화면의 빈 공간을 나타냄.
    // 둘의 차이는 X자 표시를 나타내느냐 아니냐의 차이이다.

    // 흰색 화면 만들기
    // Scaffold : 앱을 만드는 기본이 되는 뼈대 위젯.
    // 대부분의 경우 항상 사용한다.
    return Scaffold(
      // AppBar 만들기
      appBar: AppBar(
        // AppBar의 텍스트(타이틀)
        // Text를 사용해서 문자를 작성할 때, 작은 따옴표가 기본이다.
        title: Text('홈'),
      ),
      body: Center(
        // Column 추가 : Alt + enter -> Wrap with Column
        // 삭제하고싶은 위젯 : Alt + enter -> remove this widget 선택
        child: Column(
          // Column : 세로, 위에서 아래쪽으로 가는 형태
          // Row : 가로, 왼쪽에서 오른쪽으로 가는 형태
          // mainAxisAlignment
          // : 메인 방향 정렬, center는 가운데 방향
          // Column과 Row를 사용할 때, 위치를 맞추고 싶다면 사용해야한다.
          // Center로 감싸도 중앙으로 오지 않는다.
          // Center로 중앙으로 온것은 맞지만, 리스트의 형태로 위나 왼쪽에서부터(?) 시작하게 된다.
          // 그래서 mainAxisAlignment로 Column이나 Row의 안쪽을 중앙으로 정렬하게 하는 것이다.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '숫자', // 변수의 값을 넣어서 표시
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
              // Reformat Code : Ctrl + Alt + L / option + L
              // 속성들이 많이 사용이 되는 경우에 사용한다.
              // Reformat이 되는 경우는
              // 마지막 속성에 ,(컴마)가 있는 경우 줄이 바뀌면서 정리가 되고,
              // ,(컴마)가 없는 경우 한줄로 정리가 된다.
            ),
            Text(
              '$number', // 변수의 값을 넣어서 표시
              style: TextStyle(
                color: Colors.red,
                fontSize: 70,
              ),
              // Reformat Code : Ctrl + Alt + L / option + L
              // 속성들이 많이 사용이 되는 경우에 사용한다.
              // Reformat이 되는 경우는
              // 마지막 속성에 ,(컴마)가 있는 경우 줄이 바뀌면서 정리가 되고,
              // ,(컴마)가 없는 경우 한줄로 정리가 된다.
            ),
            // 버튼의 종류가 많으니 검색해서 찾아볼 것.
            // 검색 방법 : flutter button 검색 -> flutter.dev 공식 사이트에서 찾기
            // 초기 버튼 위젯의 이름에서 현재 어떤 이름인지 알 수 있다.
            ElevatedButton(
              // 기본 버튼
              onPressed: () {
                print('ElevatedButton');
              },
              child: Text('ElevatedButton'), // 버튼에 들어갈 문자
            ),
            TextButton(
              // 글자로만 된 버튼
              onPressed: () {},
              child: Text('TextButton'),
            ),
            OutlinedButton(
              // 외곽에 선이 있는 버튼
              // 글자로만 된 버튼
              onPressed: () {},
              child: Text('OutlinedButton'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed : 버튼을 눌렀을 때의 처리를 하는 부분
        // 괄호와 중괄호가 있는 것들은 함수이다.
        onPressed: () {
          // setState() : 변경된 내용으로 화면을 그려준다
          // 변경되는 값이 있을 때 꼭 써줘야한다.
          setState(() {
            // 클릭을 했을 시 증가하도록
            // 화면 그리기 / 화면 갱신
            number++;
          });
          // 문장이 끝날 때마다 세미콜론을 써야한다.
          // 컴마가 쓰인 곳들은 한줄이다.
          // 함수는 별도의 문장이기에 세미콜론을 쓴다
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
