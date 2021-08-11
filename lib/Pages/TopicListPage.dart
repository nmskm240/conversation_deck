import 'package:conversation_deck/Database/DatabaseListView.dart';
import 'package:conversation_deck/Topic.dart';
import 'package:conversation_deck/TopicDatabase.dart';
import 'package:conversation_deck/Pages/TopicMakePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カード一覧"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TopicMakePage();
              }));
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: DatabaseListView(
          future: TopicDatabase().all(),
          onTap: (Map<String, dynamic> data) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return TopicMakePage(topic: Topic.deserialize(data));
            }));
          },
          onLongPress: () {},
        ),
      ),
    );
  }
}
