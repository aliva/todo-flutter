import 'package:flutter/material.dart';

import 'todo_items.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.todoItems,
    required this.toggleState,
  }) : super(key: key);

  final List<TodoItem> todoItems;
  final Function(int) toggleState;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          value: todoItems[index].value,
          title: Text(todoItems[index].text),
          onChanged: (value) {},
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: todoItems.length,
    );
  }
}
