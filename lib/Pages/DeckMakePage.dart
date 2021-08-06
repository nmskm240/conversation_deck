import 'package:conversation_deck/Pages/DeckListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeckMakePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("デッキ作成"),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DeckListPage();
            }));
          },
        ),
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
