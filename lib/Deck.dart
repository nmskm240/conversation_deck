import 'package:conversation_deck/CardHolder.dart';

import 'TalkCard.dart';

class Deck extends CardHolder {
  var _name = "";

  Deck.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  String get name => _name;

  set name(String s) => {(s.isEmpty) ? "会話デッキ" : s};

  void shuffle() {
    cards.shuffle();
  }

  List<TalkCard> draw(int count) {
    var range = cards.take(count);
    cards.removeRange(0, count);
    return range.toList();
  }
}
