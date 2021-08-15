import 'package:conversation_deck/Pages/Home.dart';
import 'package:conversation_deck/Views/Footer.dart';
import 'package:conversation_deck/Models/FooterItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TopicList.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  Widget? body;
  final items = [
    FooterItem(route: Home(), icon: Icon(Icons.home), label: "ホーム"),
    FooterItem(
        route: TopicList(deck: null), icon: Icon(Icons.topic), label: "話題"),
    FooterItem(route: Text("設定"), icon: Icon(Icons.settings), label: "設定"),
  ];

  @override
  void initState() {
    super.initState();
    body = items.first.route;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: Footer(
        items: items,
        onTap: (int index) {
          setState(() {
            body = items[index].route;
          });
        },
      ),
    );
  }
}
