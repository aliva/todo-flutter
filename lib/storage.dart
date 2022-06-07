import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:todo/models/task.dart';

class Storage {
  static User? get currentUser => FirebaseAuth.instance.currentUser;
  static String get _uid => currentUser!.uid;
  static final _taskSubs = <StreamSubscription<DatabaseEvent>>[];

  static void addTask(Task task) async {
    final key = FirebaseDatabase.instance.ref().child("todos/$_uid").push().key;
    DatabaseReference ref = FirebaseDatabase.instance.ref("todos/$_uid/$key");
    await ref.set(task.toJson());
  }

  static void toggleTaskState(Task task) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("todos/$_uid/${task.key}");
    task.state.toggleState();

    Map<String, dynamic> updateMap = {
      "state": task.state.toString(),
    };
    if (task.state.isDone) {
      updateMap["completed_at"] = ServerValue.timestamp;
    } else {
      updateMap["completed_at"] = null;
    }
    await ref.update(updateMap);
  }

  static void deleteTask(Task task) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("todos/$_uid/${task.key}");
    await ref.remove();
  }

  static Future<void> cancelTasksSubscribes() async {
    for (final sub in _taskSubs) {
      await sub.cancel();
    }
    _taskSubs.clear();
  }

  static void onTasksChangedSubscribe(Function(List<Task>) callback) {
    final ref = FirebaseDatabase.instance.ref().child("todos/$_uid");
    var sub = ref.onValue.listen((DatabaseEvent event) {
      final tasks = <Task>[];
      for (final child in event.snapshot.children) {
        tasks.add(Task.fromJson(child.key, child.value));
      }
      callback(tasks);
    });
    _taskSubs.add(sub);
  }
}
