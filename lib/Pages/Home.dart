import 'package:conversation_deck/Database/DeckDatabase.dart';
import 'package:conversation_deck/Models/DatabaseListTile.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:conversation_deck/Pages/DeckMake.dart';
import 'package:conversation_deck/Pages/TopicList.dart';
import 'package:conversation_deck/Views/DatabaseListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Key _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
      ),
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
        child: DatabaseListView<Deck>(
          key: _key,
          future: DeckDatabase().all(),
          itemBuilder: (Deck deck) {
            return DatabaseListTile<Deck>(
              data: deck,
              onTap: (Deck data) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TopicList(
                        deck: data,
                      );
                    },
                  ),
                );
              },
              onLongPress: (Deck data) {},
            );
          },
        ),
      ),
    );
  }
}
