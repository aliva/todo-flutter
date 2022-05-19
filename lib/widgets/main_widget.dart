import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/panel_id.dart';
import 'package:todo/models/task.dart';
import 'package:todo/storage.dart';
import 'package:todo/widgets/add_page.dart';
import 'package:todo/widgets/bottom_bar.dart';
import 'package:todo/widgets/profile.dart';
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
    if (Storage.currentUser == null) {
      index = PanelId.profile.index;
    }

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

  Widget? _getFloatingActionButton() {
    if (_activePanelId == PanelId.home) {
      return FloatingActionButton(
        onPressed: onAddPressed,
        child: const Icon(Icons.add),
      );
    }
    return null;
  }

  void _updateTasks(List<Task> tasks) {
    setState(() {
      _tasks = tasks;
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Storage.cancelTasksSubscribes();
      } else {
        Storage.onTasksChangedSubscribe(_updateTasks);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setActivePanel(_activePanelId.index);

    return Scaffold(
      floatingActionButton: _getFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomBar(
        currentPanelId: _activePanelId.index,
        setActivePanel: setActivePanel,
      ),
      body: _getBody(),
    );
  }
}
