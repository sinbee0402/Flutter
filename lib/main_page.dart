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

// Hot Reload : 상단의 번개 버튼, 바로바로 바뀌는 것을 확인할 수 있다.
// build 메서드에 작성한 코드들은 바로바로 변경이 되고, 그 변경사항을 Hot Reload로 확인할 수 있다.
// Hot Restart : 하단의 Run 탭의 Hot Reload 옆의 버튼,해당 클래스의 build 메서드 밖에 작성된 것들의 변경사항을 확인할 수 있다.
// 해당 클래스 바깥의 변경사항이 반영이 안된다면 상단의 재생버튼으로 다시 Run을 해준다.
// Hot Reload가 제일 빠르고, Run이 제일 느리다.

// _를 사용할 때 : 해당 클래스 내부에서만 사용할 변수이거나, 다른 곳에서 사용하지 않을 클래스 앞에 붙여준다.
// 메서드에도 적용이 되는 부분이다. _를 붙여서 데이터를 보호하자는 느낌이다.
class _MainPageState extends State<MainPage> {
  // 변수, 인스턴스, 오브젝트(객체), 상수
  // 변수 : 어디에서나 변경이 가능하다. 하지만 final을 사용하면 변경할 수 없는 상수이다.
  // 상수를 사용하는 게 좋다.
  // 오브젝트 : 대문자로 시작하고, ()를 사용하는 애들.
  // 객체를 구현을 해놓은 클래스를 변수에 할당하는 것.
  // 위젯들은 오브젝트(객체)로 볼 수 있다.

  // 변수명은 소문자로 시작해야 한다.
  // count라는 변수에 값 0을 담음.
  int number = 10; // 변수
  // count -> number, MyHomePage -> MainPage, my_home_page -> main_page
  // 변수, 함수, 클래스 이름 한번에 변경하기
  // : Shift + F6 / 해당 변수, 함수, 클래스명 우클릭 Refactor -> Rename
  String _text = ''; // 변수
  final _textController = TextEditingController(); // 상수, 오브젝트(객체)-new가 생략되어있다.

  // controller는 사용하고 나서 해제하는 코드를 작성해줘야한다.
  // dispose 코드를 작성해줘야 메모리 문제를 해결할 수 있다.
  @override
  void dispose() {
    number = 11;
    _textController.dispose();
    super.dispose();
  }

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
        child: SingleChildScrollView(
          // 레이아웃을 짤때, 에뮬레이터에 보이는 노란선은 자주 보게 될 것이다.
          // 우측 Flutter Inspector로 레이아웃에서 무엇이 문제인지 알 수 있다.
          // 현재 해당 레이아웃의 문제는 위젯에 비해 화면의 길이가 맞지 않았으므로,
          // SingleChildScrollView를 추가해준다.
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
              Container(
                color: Colors.red, //크기가 없으면 지정된 색상이 보이지 않는다.
                width: 100,
                height: 100,
              ),
              // 위젯과 위젯 사이에 공간을 줄 때, padding이나 SizedBox를 사용하면 된다.
              SizedBox(height: 30), // 주로 크기만 지정할 때 쓴다. 색상 지정은 없다.
              Container(height: 30), // 같은 코드지만, 성능상 SizedBox가 더 좋다.
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
              Row(
                children: [
                  Expanded(
                    // 화면 기울기에 따른 위젯 크기 조절. 자주 쓴다.
                    flex: 3, // flex로 주변 위젯과의 크기 비율을 조절할 수 있다.
                    // flex를 설정하지 않으면 기본적으로 1:1 비율.
                    child: TextField(
                      // onChanged와 onPressed에 _text를 사용해서 값을 주고 받거나, _
                      // textController라는 변수를 controller에 사용해 TextField의 값을 얻을 수 있다.
                      controller: _textController,
                      // TextField를 꾸민다.
                      decoration: InputDecoration(
                        labelText: '글자', // Hint Text
                        border: OutlineInputBorder(), // TextField의 외곽선
                      ),
                      // 글자를 입력할 수 있다.
                      // 영어 상태에서 입력, 한글 상태에서는 입력이 아예 안된다.
                      // 에뮬레이터 내부의 소프트키보드에서 언어를 바꿔서 사용하면 한글이 입력된다.
                      onChanged: (text) {
                        // onChanged를 사용하려면 매개변수 String을 줘야한다.
                        _text = text;
                        // print(text);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        // TextField에 사용한 text를 얻을 수 있다.
                        print(_textController.text);
                        // 화면 갱신, 내용을 공백으로 둬도 알아서 화면을 갱신한다.
                        setState(() {});
                      },
                      child: Text('login'),
                    ),
                  ),
                ],
              ),
              Text(_textController.text),
              // 인터넷에 있는 이미지 사용하기
              Image.network(
                // 경로를 작성하면 된다.
                'https://images.khan.co.kr/article/2022/11/09/news-p.v1.20221109.bfd446dfa4ff4ac6b2722b3efe461488.jpg',
                width: 100, // 가로 길이
                height: 100, // 세로 길이
                fit: BoxFit.cover, // 꽉 채우기
              ),
              Container(
                // Container의 크기는 지정된 크기가 없을 때, 자식(child) 위젯의 크기를 따른다.
                // width: 120,
                // height: 120,
                // 자식 위젯은 Container의 크기를 따라간다.
                color: Colors.red,
                child: Padding(
                  // padding으로 Container의 여백 보기
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    // 가지고 있는 이미지 사용하기
                    'assets/han.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
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

// Flutter Inspector
// 좌측 상단의 아이콘을 선택해서 에뮬레이터의 위젯을 클릭하면 해당 위젯이 어디에 위치해있는지 관련 정보를 띄워준다.
// 에뮬레이터의 좌측 하단에 있는 돋보기 아이콘을 클릭 후, 다른 위젯을 선택하면 선택한 위젯의 정보를 볼 수 있다.
// 우측 상단의 두번째 아이콘을 누르면 위젯의 경계를 확인할 수 있다.
// Tree에서 위젯을 선택하면 해당 코드를 확인할 수 있다.
// Flutter Inspector 화면은 하단 Run에서 좌측 상단 3번째 아이콘을 누르면 비슷한 화면을 볼 수 있다.
