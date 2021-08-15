import 'package:conversation_deck/Database/TopicDatabase.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:conversation_deck/Pages/TopicMake.dart';
import 'package:conversation_deck/Views/DatabaseListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicList extends StatelessWidget {
  final Deck? deck;

  TopicList({Key? key, required this.deck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(deck == null ? "話題一覧" : deck!.name),
        leading: deck == null ? null : BackButton(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          if (deck == null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return TopicMake();
                },
              ),
            );
          } else {
            //TODO: デッキに話題を追加する処理

          }
        },
      ),
      body: Container(
        alignment: Alignment.center,
        child: DatabaseListView(
          future: deck == null
              ? TopicDatabase().all()
              : TopicDatabase().getAts(deck!.topics.map((topic) => topic.id)),
          onTap: (Topic? data) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return TopicMake(topic: data);
                },
              ),
            );
          },
          onLongPress: (Topic? data) {
            if (deck == null) {
              //TODO: 話題をデータベース上から削除する処理
            } else {
              //TODO: デッキから話題を削除する処理
            }
          },
        ),
      ),
    );
  }
}
