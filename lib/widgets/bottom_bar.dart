import 'package:flutter/material.dart';
import 'package:todo/models/panel_id.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, this.currentPanel = 0, required this.setActivePanel}) : super(key: key);

  final void Function(int) setActivePanel;
  final int currentPanel;

  @override
  Widget build(BuildContext context) {
    final items = List<BottomNavigationBarItem>.generate(
      PanelId.values.length,
      (int index) {
        if (index == PanelId.home.index) {
          return const BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: "Home",
          );
        }
        if (index == PanelId.home.index) {
          return const BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Account",
          );
        }
        throw UnsupportedError("Uknown panel id");
      },
    );

    return BottomNavigationBar(
      currentIndex: currentPanel,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setActivePanel(index);
      },
      items: items,
    );
  }
}
