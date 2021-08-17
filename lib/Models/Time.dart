import 'package:conversation_deck/Database/Models/DatabaseItem.dart';

class Time extends DatabaseItem {
  Time({String name = "", String detail = ""})
      : super(name: name, detail: detail);

  Time.parse(Map<String, dynamic> obj) : super.parse(obj);

  @override
  Map<String, dynamic> toMap() => super.toMap();

  @override
  Future init(Map<String, dynamic> obj) async {}
}
