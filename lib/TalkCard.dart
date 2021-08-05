import 'dart:convert';
import 'Database/DatabaseItem.dart';
import 'package:conversation_deck/TalkDetail.dart';

class TalkCard extends DatabaseItem {
  var _talkDetail = new TalkDetail();
  var _useCount = 0;

  TalkCard(String name, TalkDetail detail) : super() {
    super.name = name;
    _talkDetail = detail;
  }

  void use() {
    _useCount++;
  }

  TalkCard.deserialize(Map<String, dynamic> json) : super.deserialize(json) {
    super.name = json["name"];
    _talkDetail = TalkDetail.fromJson(jsonDecode(json["detail"]));
    _useCount = json["count"];
  }

  @override
  Map<String, dynamic> serialize() => {
        "name": super.name,
        "detail": jsonEncode(_talkDetail),
        "count": _useCount
      };
}
