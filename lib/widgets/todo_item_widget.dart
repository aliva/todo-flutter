import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task.dart';
import 'package:todo/storage.dart';

class TodoItemWidget extends StatelessWidget {
  final Task task;
  const TodoItemWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ObjectKey(task),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          closeOnCancel: true,
          onDismissed: () {
            Storage.deleteTask(task);
          },
        ),
        children: [
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: Colors.red,
            onPressed: (BuildContext context) {
              Storage.deleteTask(task);
            },
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          closeOnCancel: true,
          onDismissed: () {
            Storage.toggleTaskState(task);
          },
        ),
        children: [
          SlidableAction(
            icon: task.state.isDone ? Icons.check_box_outline_blank : Icons.check_box,
            backgroundColor: task.state.isDone ? Colors.blueGrey : Colors.greenAccent,
            onPressed: (BuildContext context) {
              Storage.toggleTaskState(task);
            },
          ),
        ],
      ),
      child: CheckboxListTile(
        value: task.state.isDone,
        title: Text(task.text),
        onChanged: (value) {
          Storage.toggleTaskState(task);
        },
      ),
    );
  }
}
