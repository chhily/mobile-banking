import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

class NavigationBarWidget extends StatelessWidget {
  final void Function(int)? onDestinationSelected;
  final int selectedIndex;
  const NavigationBarWidget(
      {super.key, this.onDestinationSelected, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      selectedIndex: selectedIndex,
      destinations: <Widget>[
        const NavigationDestination(
          icon: Icon(
            Icons.account_balance_outlined,
          ),
          selectedIcon: Icon(
            Icons.account_balance_rounded,
            color: AppColor.backgroundPrimary,
          ),
          label: '.',
        ),
        const NavigationDestination(
          icon: Icon(
            CupertinoIcons.chart_pie,
          ),
          selectedIcon: Icon(
            CupertinoIcons.chart_pie_fill,
            color: AppColor.backgroundPrimary,
          ),
          label: '.',
        ),
        NavigationDestination(
          icon: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.secondary),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.filter_center_focus_rounded,
              color: AppColor.backgroundPrimary,
            ),
          ),
          label: '.',
        ),
        const NavigationDestination(
          icon: Icon(
            CupertinoIcons.chat_bubble,
          ),
          label: '.',
          selectedIcon: Icon(
            CupertinoIcons.chat_bubble_fill,
            color: AppColor.backgroundPrimary,
          ),
        ),
        const NavigationDestination(
          icon: Icon(
            CupertinoIcons.person,
          ),
          label: '.',
          selectedIcon: Icon(
            CupertinoIcons.person_fill,
            color: AppColor.backgroundPrimary,
          ),
        ),
      ],
    );
  }
}
