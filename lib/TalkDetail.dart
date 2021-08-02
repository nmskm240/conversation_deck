class TalkDetail {
  DateTime? _when;
  String? _where;
  String? _who;
  String? _what;
  String? _why;
  String? _how;
  String? _other;

  DateTime? get when => _when;
  String? get where => _where;
  String? get who => _who;
  String? get what => _what;
  String? get why => _why;
  String? get how => _how;
  String? get other => _other;

  set when(DateTime? dateTime) => {_when = dateTime};
  set where(String? s) => {_where = s};
  set who(String? s) => {_who = s};
  set what(String? s) => {_what = s};
  set why(String? s) => {_why = s};
  set how(String? s) => {_how = s};
  set other(String? s) => {_other = s};

  TalkDetail(
      {DateTime? when,
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
}
