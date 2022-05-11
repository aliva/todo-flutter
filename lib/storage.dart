import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'models.dart';

class Storage {
  String get _uid => FirebaseAuth.instance.currentUser!.uid;

  void addTodoItem(Task task) {
    final newItemKey = FirebaseDatabase.instance.ref().child("todos/$_uid").push().key;

    DatabaseReference ref = FirebaseDatabase.instance.ref("todos/$_uid/$newItemKey");
    ref.set(task.toJson());
  }
}
