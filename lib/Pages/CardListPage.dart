import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('カード一覧画面'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
