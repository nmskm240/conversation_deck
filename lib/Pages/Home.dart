import 'package:conversation_deck/Database/DeckDatabase.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:conversation_deck/Views/DatabaseListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DeckMake.dart';
import 'TopicList.dart';

class Home extends StatelessWidget {
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
        child: DatabaseListView(
          future: DeckDatabase().all(),
          onTap: (Deck? data) {
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
          onLongPress: (Deck? data) {},
          onDismissed: (Deck? deck) async {
            await DeckDatabase().deleteAt(deck!.id);
          },
        ),
      ),
    );
  }
}
