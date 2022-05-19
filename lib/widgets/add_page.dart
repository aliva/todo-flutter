import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/storage.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  void onSubmitted(text) {
    Storage.addTask(Task(text: text));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: <Widget>[
        TextField(
          onSubmitted: onSubmitted,
          autofocus: true,
        )
      ]),
    );
  }
}
