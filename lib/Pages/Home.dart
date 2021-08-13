import 'package:conversation_deck/Models/Database/DeckDatabase.dart';
import 'package:conversation_deck/Models/Database/Models/Deck.dart';
import 'package:conversation_deck/Views/DatabaseListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DeckMake.dart';
import 'TopicList.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return DeckMake();
              },
            ),
          );
        },
      ),
      body: Container(
        alignment: Alignment.center,
        child: DatabaseListView(
          future: DeckDatabase().all(),
          onTap: (Map<String, dynamic> data) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return TopicList(
                    deck: Deck.deserialize(data),
                  );
                },
              ),
            );
          },
          onLongPress: () {
            //TODO: デッキを削除する処理
          },
        ),
      ),
    );
  }
}
