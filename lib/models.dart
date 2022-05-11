import 'package:firebase_database/firebase_database.dart';

enum TaskState {
  active,
  done,
}

class Task {
  final String text;
  final TaskState state;
  // ignore: prefer_typing_uninitialized_variables
  final createdAt;

  Task({
    required this.text,
    this.state = TaskState.active,
    this.createdAt = ServerValue.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "created_at": createdAt,
      "state": createdAt,
    };
  }
}
