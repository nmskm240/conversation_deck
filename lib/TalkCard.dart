import 'package:conversation_deck/TalkDetail.dart';

class TalkCard {
  var _title = '';
  var _summary = '';
  var _talkDetail = new TalkDetail();
  var _useCount = 0;

  String? get title => _title;
  String? get summary => _summary;

  TalkCard(String title, String summary, TalkDetail detail) {
    _title = title;
    _summary = summary;
    _talkDetail = detail;
  }

  void use() {
    _useCount++;
  }
}
