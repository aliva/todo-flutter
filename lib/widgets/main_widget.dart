import 'package:flutter/material.dart';
import 'package:todo/models/panel_id.dart';
import 'package:todo/widgets/add_page.dart';
import 'package:todo/widgets/bottom_bar.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/profile.dart';
import 'package:todo/storage.dart';
import 'package:todo/widgets/todo_list.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  var _tasks = <Task>[];
  PanelId _activePanelId = PanelId.home;

  void onAddPressed() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return const AddPage();
    }));
  }

  void setActivePanel(int index) {
    setState(() {
      _activePanelId = PanelId.values[index];
    });
  }

  Widget _getBody() {
    if (_activePanelId == PanelId.home) {
      return TodoList(tasks: _tasks);
    }
    if (_activePanelId == PanelId.profile) {
      return const Profile();
    }
    throw UnsupportedError("Uknown panel id");
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
        currentPanel: _activePanelId.index,
        setActivePanel: setActivePanel,
      ),
      body: _getBody(),
    );
  }
}
