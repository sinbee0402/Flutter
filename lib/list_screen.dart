import 'package:flutter/material.dart';
import 'package:todo_list/components/todo_item.dart';
import 'package:todo_list/create_screen.dart';
import 'package:todo_list/model/todo.dart';

import 'main.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView(
        children: todos.values
            .map((e) => TodoItem(
                  todo: e,
                  onTap: (todo) async {
                    todo.isDone = !todo.isDone;
                    await todo.save();

                    setState(() {});
                  },
                  onDelete: (todo) async {
                    await todo.delete();

                    setState(() {});
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
