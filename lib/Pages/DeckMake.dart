import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeckMake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("デッキ作成"),
        leading: BackButton(),
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
