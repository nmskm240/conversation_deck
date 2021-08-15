import 'package:conversation_deck/Database/TopicDatabase.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:conversation_deck/Pages/TopicMake.dart';
import 'package:conversation_deck/Views/DatabaseListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopicList extends StatelessWidget {
  Deck? _deck;
  AppBar? _appBar;

  TopicList({Deck? deck}) {
    _deck = deck;
    _appBar = deck == null
        ? null
        : AppBar(title: Text(deck.name), leading: BackButton());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          if (_deck == null) {
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
          future: _deck == null
              ? TopicDatabase().all()
              : TopicDatabase().getAts(_deck!.topics.map((topic) => topic.id)),
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
            if (_deck == null) {
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
