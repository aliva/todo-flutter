import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo_items.dart';
import 'add_page.dart';
import 'bottom_bar.dart';
import 'profile.dart';
import 'todo_list.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final _todoItems = <TodoItem>[];
  int _currentPanelIndex = 0;

  void addTodoItem(String text) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final newItemKey = FirebaseDatabase.instance.ref().child("todos/$userId").push().key;

    DatabaseReference ref = FirebaseDatabase.instance.ref("todos/$userId/$newItemKey");
    ref.set({
      "text": text,
      "created_at": ServerValue.timestamp,
    });

    setState(() {
      _todoItems.add(TodoItem(text: text));
    });
  }

  void onAddPressed() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return AddPage(
        addTodoItem: addTodoItem,
      );
    }));
  }

  void setActivePanel(int index) {
    setState(() {
      _currentPanelIndex = index;
    });
  }

  void toggleState(int index) {
    setState(() {
      _todoItems[index].value = !_todoItems[index].value;
    });
  }

  Widget _getBody() {
    switch (_currentPanelIndex) {
      case 0:
        return TodoList(
          todoItems: _todoItems,
          toggleState: toggleState,
        );
      case 1:
        return const Profile();
      default:
        throw Exception("Uknown page");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onAddPressed,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomBar(
        currentPanel: _currentPanelIndex,
        setActivePanel: setActivePanel,
      ),
      body: _getBody(),
    );
  }
}
