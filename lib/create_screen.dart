import 'package:flutter/material.dart';

import 'main.dart';
import 'model/todo.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo write'),
        actions: [
          IconButton(
            onPressed: () async {
              await todos.add(Todo(
                title: _textController.text,
                dateTime: DateTime.now().millisecondsSinceEpoch,
              ));

              if (mounted) {
                // 화면이 잘 표시가 되고있는지 확인
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: '할 일을 입력하세요',
            filled: true,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
