import 'package:conversation_deck/Database/DatabaseListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Deck.dart';
import '../DeckDatabase.dart';
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
