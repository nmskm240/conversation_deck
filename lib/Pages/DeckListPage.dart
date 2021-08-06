import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeckListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("デッキ一覧"),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[],
        ),
      ),
    );
  }
}
