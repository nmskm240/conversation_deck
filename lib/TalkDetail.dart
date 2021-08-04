import 'package:conversation_deck/Time.dart';

class TalkDetail {
  Time _when = Time.Today;
  String? _where;
  String? _who;
  String? _what;
  String? _why;
  String? _how;
  String? _other;

  Time get when => _when;
  String? get where => _where;
  String? get who => _who;
  String? get what => _what;
  String? get why => _why;
  String? get how => _how;
  String? get other => _other;

  set when(Time o) => {_when = o};
  set where(String? s) => {_where = s};
  set who(String? s) => {_who = s};
  set what(String? s) => {_what = s};
  set why(String? s) => {_why = s};
  set how(String? s) => {_how = s};
  set other(String? s) => {_other = s};

  TalkDetail(
      {Time when = Time.Today,
      String? where,
      String? who,
      String? what,
      String? why,
      String? how,
      String? other}) {
    _when = when;
    _where = where;
    _who = who;
    _what = what;
    _why = why;
    _how = how;
    _other = other;
  }

  TalkDetail.fromJson(Map<String, dynamic> json)
      : _when = Time.values[json["when"]],
        _where = json["where"],
        _who = json["who"],
        _what = json["what"],
        _why = json["why"],
        _how = json["how"],
        _other = json["other"];

  Map<String, dynamic> toJson() => {
        "when": _when.index,
        "where": _where,
        "who": _who,
        "what": _what,
        "why": _why,
        "how": _how,
        "other": _other
      };
}
