import 'package:conversation_deck/Database/Models/DatabaseItem.dart';

class Topic extends DatabaseItem {
  DateTime when = DateTime.now();
  String where = "";
  String who = "";
  String whatUp = "";
  int _useCount = 0;

  int get useCount => _useCount;

  Topic({required String name, String detail = ""})
      : super(name: name, detail: detail);

  Topic.parse(Map<String, dynamic> obj) : super.parse(obj) {
    when = DateTime.tryParse(obj["_when"]) ?? DateTime.now();
    where = obj["_where"];
    who = obj["who"];
    whatUp = obj["whatUp"];
    _useCount = obj["count"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      "_when": when.toString(),
      "_where": where,
      "who": who,
      "whatUp": whatUp,
      "count": _useCount
    });
    return map;
  }

  @override
  Future init(Map<String, dynamic> obj) {
    return Future(() {});
  }

  void use() {
    _useCount++;
  }
}
