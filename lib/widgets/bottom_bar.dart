import 'package:flutter/material.dart';
import 'package:todo/models/panel_id.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.currentPanelId,
    required this.setActivePanel,
  }) : super(key: key);

  final void Function(int) setActivePanel;
  final int currentPanelId;

  List<BottomNavigationBarItem> _getItems() {
    return List<BottomNavigationBarItem>.generate(
      PanelId.values.length,
      (int index) {
        if (index == PanelId.home.index) {
          return const BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: "Home",
          );
        }
        if (index == PanelId.profile.index) {
          return const BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Account",
          );
        }
        return const BottomNavigationBarItem(
          icon: Icon(Icons.question_mark),
          label: "Unknown",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPanelId,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setActivePanel(index);
      },
      items: _getItems(),
    );
  }
}
