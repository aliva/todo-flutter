import 'package:firebase_database/firebase_database.dart';
import 'package:todo/models/task_state.dart';

class Task {
  final String? key;
  final String text;
  late TaskState state;
  dynamic createdAt;

  Task({
    required this.text,
    this.key,
  }) {
    state = TaskState();
    createdAt = ServerValue.timestamp;
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
