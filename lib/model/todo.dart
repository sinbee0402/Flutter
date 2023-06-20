import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int dateTime;

  @HiveField(3)
  bool isDone;

  Todo({
    required this.title,
    required this.dateTime,
    this.isDone = false,
  });
}

// 자바같은 코드
// Todo('asdf', 12312);

// flutter 같은 코드
// Todo(title: 'asdf', dateTime: 12312);
