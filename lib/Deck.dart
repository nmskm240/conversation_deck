import 'Database/DatabaseItem.dart';
import 'Topic.dart';

class Deck extends DatabaseItem {
  List<Topic> _topics = [];
  static String separator = ",";

  Iterable<Topic> get topics => _topics;

  Deck(
      {int id = 0,
      required String name,
      String detail = "",
      required Iterable<Topic> topics})
      : super(name: name, detail: detail) {
    _topics = topics.toList();
  }

  Deck.deserialize(Map<String, dynamic> obj) : super.deserialize(obj) {
    _topics = obj["topics"];
  }

  @override
  Map<String, dynamic> serialize() {
    var map = super.serialize();
    map.addAll({"topics": _topics.map((topic) => topic.id).join(separator)});
    return map;
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
