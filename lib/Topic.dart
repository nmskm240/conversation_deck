import 'dart:convert';

import 'Database/DatabaseItem.dart';
import 'TopicInfo.dart';

class Topic extends DatabaseItem {
  var _useCount = 0;
  late TopicInfo _info;
  List<String> _affiliations = [];
  DateTime _timestamp = DateTime.now();

  int get useCount => _useCount;
  TopicInfo get info => _info;
  Iterable<String> get affiliations => _affiliations;
  DateTime get timestamp => _timestamp;

  Topic({required String name, String detail = "", required TopicInfo info}) : super(name: name) {
    _info = info;
    _affiliations.add(info.when.name);
  }

  void use() {
    _useCount++;
  }

  Topic.deserialize(Map<String, dynamic> json) : super.deserialize(json) {
    _useCount = json["count"];
    _info = TopicInfo.fromJson(jsonDecode(json["info"]));
    _affiliations = (json["affiliations"] as String).split(",");
    _timestamp = DateTime.tryParse(json["time"]) ?? DateTime.now();
  }

  @override
  Map<String, dynamic> serialize() {
    var map = super.serialize();
    map.addAll({
      "count": _useCount,
      "info": jsonEncode(_info),
      "affiliations": _affiliations.join(","),
      "time": _timestamp.toString()
    });
    return map;
  }
}
