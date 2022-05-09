import 'package:flutter/material.dart';
import 'package:todo/todo_items.dart';

import 'add_page.dart';
import 'bottom_bar.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final todoItems = <TodoItem>[];
  int _currentPanelIndex = 0;

  void addTodoItem(String text) {
    setState(() {
      todoItems.add(TodoItem(text: text));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onAddPressed,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(
        currentPanel: _currentPanelIndex,
        setActivePanel: setActivePanel,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            value: todoItems[index].value,
            title: Text(todoItems[index].text),
            onChanged: (value) {
              setState(() {
                todoItems[index].value = !todoItems[index].value;
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: todoItems.length,
      ),
    );
  }
}
