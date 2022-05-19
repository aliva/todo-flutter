import 'package:firebase_database/firebase_database.dart';
import 'package:todo/models/task_state.dart';

class Task {
  final String? key;
  final String text;
  late TaskState state;
  // ignore: prefer_typing_uninitialized_variables
  final createdAt;

  Task({
    required this.text,
    this.key,
    TaskState? state,
    this.createdAt = ServerValue.timestamp,
  }) {
    state ??= TaskState();
  }

  Task.fromJson(
    this.key,
    final json,
  )   : text = json["text"],
        state = TaskState(json["state"]),
        createdAt = json["created_at"];

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "created_at": createdAt,
      "state": state.toString(),
    };
  }
}
