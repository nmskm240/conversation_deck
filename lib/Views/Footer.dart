import 'package:conversation_deck/Views/Models/FooterItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final List<FooterItem> items;
  final void Function(int) onTap;

  Footer({required this.items, required this.onTap});

  @override
  _FooterState createState() => _FooterState(items: items, onTap: onTap);
}

class _FooterState extends State<Footer> {
  final List<FooterItem> items;
  final void Function(int) onTap;
  int _currentIndex = 0;

  _FooterState({required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
        onTap(index);
      },
    );
  }
}
