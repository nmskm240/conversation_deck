import 'dart:convert';

import 'package:conversation_deck/TalkDetail.dart';

class TalkCard {
  var _title = '';
  var _summary = '';
  var _talkDetail = new TalkDetail();
  var _useCount = 0;

  String? get title => _title;
  String? get summary => _summary;
  TalkDetail get detail => _talkDetail;

  TalkCard(String title, String summary, TalkDetail detail) {
    _title = title;
    _summary = summary;
    _talkDetail = detail;
  }

  void use() {
    _useCount++;
  }

  TalkCard.fromJson(Map<String, dynamic> json)
      : _title = json["title"],
        _summary = json["summary"],
        _talkDetail = json["detail"],
        _useCount = json["count"];

  Map<String, dynamic> toJson() => {
        "title": _title,
        "summary": _summary,
        "detail": _talkDetail,
        "count": _useCount
      };
}
