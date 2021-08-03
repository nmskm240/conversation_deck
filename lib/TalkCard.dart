import 'Database/DatabaseItem.dart';
import 'package:conversation_deck/TalkDetail.dart';

class TalkCard extends DatabaseItem {
  var _title = "";
  var _talkDetail = new TalkDetail();
  var _useCount = 0;

  @override
  String get name => _title;
  @override
  set name(String s) => {_title = s};

  TalkCard(String title, TalkDetail detail) {
    _title = title;
    _talkDetail = detail;
  }

  void use() {
    _useCount++;
  }

  TalkCard.deserialize(Map<String, dynamic> json)
      : _title = json["name"],
        _talkDetail = json["detail"],
        _useCount = json["count"];

  Map<String, dynamic> serialize() =>
      {"name": _title, "detail": _talkDetail, "count": _useCount};
}
