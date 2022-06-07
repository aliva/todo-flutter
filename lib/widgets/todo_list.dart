import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
        return Slidable(
          key: ObjectKey(tasks[index]),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                Storage.toggleTaskState(tasks[index]);
              },
            ),
            children: const [],
          ),
          child: CheckboxListTile(
            value: tasks[index].state.isDone,
            title: Text(tasks[index].text),
            onChanged: (value) {
              Storage.toggleTaskState(tasks[index]);
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: tasks.length,
    );
  }
}
