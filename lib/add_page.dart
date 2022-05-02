import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  final Function addTodoItem;

  const AddPage({Key? key, required this.addTodoItem}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  void onSubmitted(text) {
    widget.addTodoItem(text);
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
