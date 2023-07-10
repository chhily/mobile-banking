import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        animationDuration: const Duration(seconds: 1),
        
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations:  <Widget>[
          NavigationDestination(
            icon: const Icon(Icons.home),
            selectedIcon: buildNavBarIcon(icon: Icons.home, text: 'Home'),
            label: 'Home',
          ),
          NavigationDestination(
            icon: const Icon(Icons.store),
            selectedIcon: buildNavBarIcon(icon: Icons.store, text: 'Stores'),
            label: 'Stores',
          ),
          NavigationDestination(
            icon: const Icon(Icons.list_alt_outlined),
            selectedIcon: buildNavBarIcon(icon: Icons.list, text: 'Order'),
            label: 'Order',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }

  Widget buildNavBarIcon({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        WidthAppSpace.smallSpace,
        UIHelper.textHelper(text: text)
      ],
    );
  }
}
