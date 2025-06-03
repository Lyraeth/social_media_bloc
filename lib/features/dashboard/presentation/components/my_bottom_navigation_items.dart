import 'package:flutter/material.dart';

class MyBottomNavigationItems extends StatefulWidget {
  const MyBottomNavigationItems({super.key});

  @override
  State<MyBottomNavigationItems> createState() =>
      _MyBottomNavigationItemsState();
}

class _MyBottomNavigationItemsState extends State<MyBottomNavigationItems> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      unselectedLabelStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
      unselectedItemColor: Theme.of(context).colorScheme.primary,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notification",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
      ],
      selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
