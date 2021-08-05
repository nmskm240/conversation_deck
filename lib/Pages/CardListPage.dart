import 'package:conversation_deck/CardDatabase.dart';
import 'package:conversation_deck/TalkCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardListPage extends StatefulWidget {
  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カード一覧"),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: CardDatabase.instance.all(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TalkCard>?> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                } else {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _showCards(snapshot.data),
                    );
                  } else {
                    return Text("カードなし");
                  }
                }
              }),
        ),
      ),
    );
  }

  List<Widget> _showCards(Iterable<TalkCard>? cards) {
    List<Widget> widgets = [];
    cards?.forEach((card) {
      widgets.add(
        Card(
          child: Text(card.name),
        ),
      );
    });
    return widgets;
  }
}
