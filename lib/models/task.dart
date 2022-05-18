import 'package:firebase_database/firebase_database.dart';

import 'task_state.dart';

class Task {
  final String? key;
  final String text;
  final TaskState state;
  // ignore: prefer_typing_uninitialized_variables
  final createdAt;

  Task({
    required this.text,
    this.key,
    this.state = TaskState.active,
    this.createdAt = ServerValue.timestamp,
  });

  Task.fromJson(
    this.key,
    final json,
  )   : text = json["text"],
        state = TaskState.values[json["state"]],
        createdAt = json["created_at"];

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "created_at": createdAt,
      "state": state.index,
    };
  }
}
