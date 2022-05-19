import 'package:flutter/material.dart';
import 'package:todo/add_page.dart';
import 'package:todo/bottom_bar.dart';
import 'package:todo/models/task.dart';
import 'package:todo/profile.dart';
import 'package:todo/storage.dart';
import 'package:todo/todo_list.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  var _tasks = <Task>[];
  int _currentPanelIndex = 0;

  void onAddPressed() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return const AddPage();
    }));
  }

  void setActivePanel(int index) {
    setState(() {
      _currentPanelIndex = index;
    });
  }

  Widget _getBody() {
    switch (_currentPanelIndex) {
      case 0:
        return TodoList(tasks: _tasks);
      case 1:
        return const Profile();
      default:
        throw Exception("Uknown page");
    }
  }

  @override
  void initState() {
    super.initState();
    Storage().onTodoChangedHandler((List<Task> tasks) => {
          setState(() {
            _tasks = tasks;
          })
        });
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
