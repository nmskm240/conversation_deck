import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'Time.dart';

class TopicInfo extends DatabaseItem {
  late Time when;
  var where = "";
  var who = "";
  var what = "";
  var why = "";
  var how = "";
  var whatUp = "";
  var specifically = "";

  TopicInfo();

  TopicInfo.deserialize(Map<String, dynamic> json) : super.deserialize(json) {
    when = json["_when"];
    where = json['_where'];
    who = json['who'];
    what = json['what'];
    why = json['why'];
    how = json['how'];
    whatUp = json['whatUp'];
    specifically = json['specifically'];
  }

  @override
  Map<String, dynamic> serialize() {
    var map = super.serialize();
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
}
