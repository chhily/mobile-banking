import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';


class NavigationBarWidget extends StatelessWidget {
  final void Function(int)? onDestinationSelected;
  final int selectedIndex;
  const NavigationBarWidget({super.key, this.onDestinationSelected, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        animationDuration: const Duration(seconds: 1),
        
        onDestinationSelected: onDestinationSelected,
        selectedIndex: selectedIndex,
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
