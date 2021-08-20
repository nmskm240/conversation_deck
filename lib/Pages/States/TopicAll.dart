import 'package:conversation_deck/Database/TopicDatabase.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:conversation_deck/Pages/States/TopicListState.dart';
import 'package:conversation_deck/Pages/TopicMake.dart';
import 'package:flutter/material.dart';

class TopicAll extends TopicListState {
  TopicAll()
      : super(
          appBar: AppBar(
            title: Text("話題一覧"),
          ),
          future: TopicDatabase().all(),
        );

  @override
  void onFloatingButtonPressed() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return TopicMake();
        },
      ),
    );
    update();
  }

  @override
  void onListTileLongPress(Topic topic) {}

  @override
  void onListTileTap(Topic topic) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return TopicMake(topic: topic);
        },
      ),
    );
    update();
  }

  @override
  void update() {
    setState(() {
      future = TopicDatabase().all();
    });
  }

  @override
  void onDismissed(Topic topic) {
    TopicDatabase().deleteAt(topic.id);
  }
}
