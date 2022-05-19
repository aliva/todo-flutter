import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/storage.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          value: tasks[index].state.isActive() ? false : true,
          title: Text(tasks[index].text),
          onChanged: (value) {
            Storage().toggleTodoState(tasks[index]);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: tasks.length,
    );
  }
}
