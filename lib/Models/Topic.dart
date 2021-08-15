import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:conversation_deck/Database/TopicInfoDatabase.dart';
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

  Topic.parse(Map<String, dynamic> json) : super.parse(json) {
    _useCount = json["count"];
    _timestamp = DateTime.tryParse(json["time"]) ?? DateTime.now();
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"count": _useCount, "time": _timestamp.toString()});
    return map;
  }

  @override
  Future init(Map<String, dynamic> obj) async {
    var data = await TopicInfoDatabase().getAt(id);
    if (data != null) {
      _info = data;
    } else {
      throw Error();
    }
  }

  void use() {
    _useCount++;
  }
}
