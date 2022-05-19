import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, this.currentPanel = 0, required this.setActivePanel}) : super(key: key);

  final Function(int) setActivePanel;
  final int currentPanel;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPanel,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setActivePanel(index);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.check_box),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: "Account",
        ),
      ],
    );
  }
}
