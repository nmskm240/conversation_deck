import 'package:conversation_deck/Controllers/DeckForm.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeckMake extends StatelessWidget {
  final Deck? deck;
  late final DeckForm form;

  DeckMake({this.deck}) {
    form = DeckForm(deck: deck);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("デッキ作成"),
        leading: BackButton(),
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              form.onComplete();
            },
          )
        ],
      ),
      body: form,
    );
  }
}
