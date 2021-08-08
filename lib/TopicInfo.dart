import 'Time.dart';
import 'TimeDatabase.dart';

class TopicInfo {
  late Time when;
  var where = "";
  var who = "";
  var what = "";
  var why = "";
  var how = "";
  var whatUp = "";
  var specifically = "";

  TopicInfo();

  TopicInfo.fromJson(Map<String, dynamic> json) {
    TimeDatabase().all().then((times) => when = times!.elementAt(json['when']));
    where = json['where'];
    who = json['who'];
    what = json['what'];
    why = json['why'];
    how = json['how'];
    whatUp = json['whatUp'];
    specifically = json['specifically'];
  }

  Map<String, dynamic> toJson() => {
        'when': when.id,
        'where': where,
        'who': who,
        'what': what,
        'why': why,
        'how': how,
        'whatUp': whatUp,
        'specifically': specifically,
      };
}
