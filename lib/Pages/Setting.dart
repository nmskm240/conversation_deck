import 'package:conversation_deck/Database/DeckDatabase.dart';
import 'package:conversation_deck/Database/TopicDatabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("設定"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text("リセット"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        content: Text("データベースを初期化しますか？"),
                        actions: <Widget>[
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: Text("OK"),
                            onPressed: () async {
                              await DeckDatabase().reset();
                              await TopicDatabase().reset();
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}
