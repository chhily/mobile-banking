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
      bottomNavigationBar: NavigationBarWidget(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (newIndex) {
          setState(() {
            currentPageIndex = newIndex;
          });
        },
      ),
      body: <Widget>[
        const MyAppHomePage(),
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
        Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
        Container(
          color: Colors.pink,
          alignment: Alignment.center,
          child: const Text('Page 5'),
        ),
      ][currentPageIndex],
    );
  }
}
