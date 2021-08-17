import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:conversation_deck/Database/TimeDatabase.dart';
import 'package:conversation_deck/Models/Time.dart';

class TopicInfo extends DatabaseItem {
  Time when = new Time();
  String where = "";
  String who = "";
  String what = "";
  String why = "";
  String how = "";
  String whatUp = "";
  String specifically = "";

  TopicInfo();

  TopicInfo.parse(Map<String, dynamic> obj) : super.parse(obj) {
    where = obj['_where'];
    who = obj['who'];
    what = obj['what'];
    why = obj['why'];
    how = obj['how'];
    whatUp = obj['whatUp'];
    specifically = obj['specifically'];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      '_when': when.id,
      '_where': where,
      'who': who,
      'what': what,
      'why': why,
      'how': how,
      'whatUp': whatUp,
      'specifically': specifically,
    });
    return map;
  }

  @override
  Future init(Map<String, dynamic> obj) async {
    var time = await TimeDatabase().getAt(obj["_when"]);
    if (time != null) {
      when = time;
    } else {
      throw Error();
    }
  }
}
