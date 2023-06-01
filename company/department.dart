import 'dart:convert';
import 'dart:io';

// 06.01.과제

class Employee {
  // 사원
  String name;
  int age;

  Employee(this.name, this.age);

  // 역직렬화
  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  // 직렬화
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}

class Department {
  // 부서
  String name;
  Employee leader;

  Department(this.name, this.leader);

  // 직렬화 - json으로 변환시키기
  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader.toJson(),
      };

  // 역직렬화 - json에서 변환시키기
  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(json['leader']);
}

void main() {
  // 총무부 리더 홍길동(41세) 인스턴스를 생성
  // -> 직렬화하여 company.txt 파일에 쓰는 프로그램을 작성
  final hong = Department("총무부", Employee("홍길동", 41));
  final serialization = hong.toJson();

  final copyFile = File('lib/homework/company/company.txt');

  // json 직렬화
  print('직렬화 : ${jsonEncode(serialization)}');
  copyFile.writeAsStringSync(jsonEncode(serialization));

  // json 역직렬화
  final user = Department.fromJson(serialization);
  print('역직렬화 : ${user.name}, ${user.leader.name}, ${user.leader.age}');
}
