import '../TimeDatabase.dart';
import '../TopicDatabase.dart';
import 'TopicListPage.dart';
import 'ConversationPage.dart';
import 'DeckListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.restore),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Text("データベースを初期化しますか？"),
                    actions: <TextButton>[
                      TextButton(
                        child: Text("NO"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text("YES"),
                        onPressed: () {
                          TopicDatabase().restore();
                          TimeDatabase().restore();
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                content: Text("データベースを初期化しました。"),
                                actions: <TextButton>[
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
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
                  );
                },
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return new ConversationPage();
                }));
              },
              child: Text('会話スタート'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return new DeckListPage();
                }));
              },
              child: Text('会話デッキ一覧'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return new TopicListPage();
                }));
              },
              child: Text('会話カード一覧'),
            ),
          ],
        ),
      ),
    );
  }
}
