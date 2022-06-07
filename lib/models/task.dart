import 'package:firebase_database/firebase_database.dart';
import 'package:todo/models/task_state.dart';

class Task {
  final String? key;
  final String text;
  late TaskState state;
  dynamic createdAt;
  dynamic completedAt;

  Task({
    required this.text,
    this.key,
  }) {
    state = TaskState();
    createdAt = ServerValue.timestamp;
    completedAt = null;
  }

  Task.fromJson(
    this.key,
    final json,
  )   : text = json["text"],
        state = TaskState(json["state"]),
        createdAt = json["created_at"],
        completedAt = json.containsKey("completed_at") ? json["completed_at"] : null;

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "created_at": createdAt,
      "completed_at": completedAt,
      "state": state.toString(),
    };
  }
}
