import 'package:conversation_deck/Models/Deck.dart';
import 'package:conversation_deck/Pages/States/DecksTopic.dart';
import 'package:conversation_deck/Pages/States/TopicAll.dart';
import 'package:conversation_deck/Pages/States/TopicListState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicList extends StatefulWidget {
  final Deck? deck;

  const TopicList({required this.deck});

  @override
  TopicListState createState() {
    if (deck != null) {
      return DecksTopic(deck: deck as Deck);
    } else {
      return TopicAll();
    }
  }
}
