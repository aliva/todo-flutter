import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

enum TaskState {
  active,
  done,
}

class Storage {
  String get _uid => FirebaseAuth.instance.currentUser!.uid;

  void addTodoItem(String text) {
    final newItemKey = FirebaseDatabase.instance.ref().child("todos/$_uid").push().key;

    DatabaseReference ref = FirebaseDatabase.instance.ref("todos/$_uid/$newItemKey");
    ref.set({
      "text": text,
      "created_at": ServerValue.timestamp,
      "state": TaskState.active.index,
    });
  }
}
