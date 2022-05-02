import 'package:flutter/material.dart';
import 'package:todo/todo_items.dart';

import 'add_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todoItems = <TodoItem>[];

  void addTodoItem(String text) {
    setState(() {
      todoItems.add(TodoItem(text: text));
    });
  }

  void onAddPressed() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return AddPage(
        addTodoItem: addTodoItem,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: onAddPressed, child: const Icon(Icons.add)),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            value: todoItems[index].value,
            title: Text(todoItems[index].text),
            onChanged: (value) {
              setState(() {
                todoItems[index].value = !todoItems[index].value;
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: todoItems.length,
      ),
    );
  }
}
