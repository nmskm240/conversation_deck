import 'package:conversation_deck/Database/TopicDatabase.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:conversation_deck/Pages/States/TopicListState.dart';
import 'package:flutter/material.dart';

class DecksTopic extends TopicListState {
  final Deck deck;

  DecksTopic({required this.deck})
      : super(
          appBar: AppBar(
            title: Text(deck.name),
            leading: BackButton(),
          ),
          future: TopicDatabase().getAts(deck.topics.map((topic) => topic.id)),
        );

  @override
  void onFloatingButtonPressed() {
    // TODO: デッキに話題を追加する
  }

  @override
  void onListTileLongPress(Topic? topic) {
    // TODO: デッキから話題を削除する
  }

  @override
  void onListTileTap(Topic? topic) {
    // TODO: 話題の詳細を表示する
  }

  @override
  void update() {
    setState(() {
      future = TopicDatabase().getAts(deck.topics.map((topic) => topic.id));
    });
  }
}
