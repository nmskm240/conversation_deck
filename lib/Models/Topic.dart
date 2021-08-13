import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'TopicInfo.dart';

class Topic extends DatabaseItem {
  var _useCount = 0;
  late TopicInfo _info;
  DateTime _timestamp = DateTime.now();

  int get useCount => _useCount;
  TopicInfo get info => _info;
  DateTime get timestamp => _timestamp;

  Topic({required String name, String detail = "", required TopicInfo info})
      : super(name: name) {
    _info = info;
  }

  void use() {
    _useCount++;
  }

  Topic.deserialize(Map<String, dynamic> json) : super.deserialize(json) {
    _useCount = json["count"];
    _info = json["info"];
    _timestamp = DateTime.tryParse(json["time"]) ?? DateTime.now();
  }

  @override
  Map<String, dynamic> serialize() {
    var map = super.serialize();
    map.addAll({
      "count": _useCount,
      "time": _timestamp.toString()
    });
    return map;
  }
}
