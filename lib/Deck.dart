import 'TalkCard.dart';

class Deck {
  var _name = "";
  List<TalkCard> _cards = [];

  String get name => _name;
  Iterable<TalkCard> get cards => _cards;

  set name(String s) => {(s.isEmpty) ? "会話デッキ" : s};

  Deck(Iterable<TalkCard> cards) {
    _cards = cards.toList();
  }

  void shuffle() {
    _cards.shuffle();
  }

  List<TalkCard> draw(int count) {
    var range = _cards.take(count);
    _cards.removeRange(0, count);
    return range.toList();
  }
}
