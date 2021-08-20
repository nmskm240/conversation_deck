import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:conversation_deck/Database/TopicDatabase.dart';
import 'Topic.dart';

class Deck extends DatabaseItem {
  List<Topic> _topics = [];
  static String separator = ",";

  Iterable<Topic> get topics => _topics;

  Deck(
      {required String name,
      String detail = "",
      required Iterable<Topic> topics})
      : super(name: name, detail: detail) {
    _topics = topics.toList();
  }

  Deck.parse(Map<String, dynamic> obj) : super.parse(obj);

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"topics": _topics.map((topic) => topic.id).join(separator)});
    return map;
  }

  @override
  Future init(Map<String, dynamic> obj) async {
    var datas = await TopicDatabase()
        .getAts(obj["topics"].toString().split(Deck.separator).cast<int>());
    datas.forEach((data) => _topics.add(data));
  }

  void shuffle() {
    _topics.shuffle();
  }

  List<Topic> draw(int count) {
    var range = _topics.take(count);
    _topics.removeRange(0, count);
    return range.toList();
  }

  void remove(Topic topic) {
    _topics.remove(topic);
  }
}
