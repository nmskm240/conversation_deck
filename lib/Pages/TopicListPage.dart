import 'package:conversation_deck/TopicDatabase.dart';
import 'package:conversation_deck/Pages/TopicMakePage.dart';
import 'package:conversation_deck/Topic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicListPage extends StatefulWidget {
  @override
  _TopicListPageState createState() => _TopicListPageState();
}

class _TopicListPageState extends State<TopicListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カード一覧"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TopicMakePage();
              }));
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: TopicDatabase().all(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Topic>?> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            } else {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                var cards = snapshot.data!;
                return GridView.count(
                  crossAxisCount: 2,
                  children: _showCards(cards),
                );
              } else {
                return Text("カードなし");
              }
            }
          },
        ),
      ),
    );
  }

  List<Widget> _showCards(Iterable<Topic> cards) {
    List<Widget> widgets = [];
    cards.forEach((card) {
      widgets.add(Card(
        child: Text(card.name),
      ));
    });
    return widgets;
  }
}
