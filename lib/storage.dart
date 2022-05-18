import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'models/task.dart';
import 'models/task_state.dart';

class Storage {
  String get _uid => FirebaseAuth.instance.currentUser!.uid;

  void addTodoItem(Task task) {
    final key = FirebaseDatabase.instance.ref().child("todos/$_uid").push().key;
    DatabaseReference ref = FirebaseDatabase.instance.ref("todos/$_uid/$key");
    ref.set(task.toJson());
  }

  void toggleTodoState(Task task) {
    DatabaseReference ref = FirebaseDatabase.instance.ref("todos/$_uid/${task.key}");

    if (task.state == TaskState.active) {
      ref.update({"state": TaskState.done.index});
    } else if (task.state == TaskState.done) {
      ref.update({"state": TaskState.active.index});
    }
  }

  void onTodoChangedHandler(Function(List<Task>) callback) {
    final ref = FirebaseDatabase.instance.ref().child("todos/$_uid");
    ref.onValue.listen((DatabaseEvent event) {
      final tasks = <Task>[];
      for (final child in event.snapshot.children) {
        tasks.add(Task.fromJson(child.key, child.value));
      }
      callback(tasks);
    });
  }
}
