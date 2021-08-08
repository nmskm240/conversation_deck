import 'Topic.dart';

class Deck {
  var _name = "";
  List<Topic> _topics = [];

  String get name => _name;
  Iterable<Topic> get cards => _topics;

  set name(String s) => {(s.isEmpty) ? "会話デッキ" : s};

  Deck(Iterable<Topic> topics) {
    _topics = topics.toList();
  }

  void shuffle() {
    _topics.shuffle();
  }

  List<Topic> draw(int count) {
    var range = _topics.take(count);
    _topics.removeRange(0, count);
    return range.toList();
  }
}
