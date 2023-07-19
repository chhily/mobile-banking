import 'package:flutter/material.dart';
import 'package:ui_practice/bottom_nav/widget/navigation_bar.dart';
import 'package:ui_practice/view/home/home.dart';

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
      body: const MyAppHomePage(),
    );
    return Scaffold(
      bottomNavigationBar: NavigationBarWidget(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (newIndex) {
          setState(() {
            currentPageIndex = newIndex;
          });
        },
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (currentPageIndex) {
      case 0:
        return const MyAppHomePage();
      case 1:
        return Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        );
      case 2:
        return Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('Page 3'));
      case 3:
        return Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          child: const Text('Page 4'),
        );
      case 4:
        return Container(
          color: Colors.pink,
          alignment: Alignment.center,
          child: const Text('Page 5'),
        );
      default:
        return const SizedBox();
    }
  }
}
