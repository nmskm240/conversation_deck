import 'CardListPage.dart';
import 'CardMakePage.dart';
import 'ConversationPage.dart';
import 'DeckMakePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(64),
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
                  return new CardMakePage();
                }));
              },
              child: Text('会話カード作成'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return new DeckMakePage();
                }));
              },
              child: Text('会話デッキ作成'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return new CardListPage();
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
