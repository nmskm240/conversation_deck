import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterItem extends BottomNavigationBarItem {
  final Widget route;

  FooterItem(
      {required this.route,
      required Widget icon,
      required String label,
      Widget? activeIcon,
      Color? backgroundColor,
      String? tooltip})
      : super(
          icon: icon,
          label: label,
          activeIcon: activeIcon,
          backgroundColor: backgroundColor,
          tooltip: tooltip,
        );
}
