import 'package:conversation_deck/Database/Models/DatabaseItem.dart';

class Time extends DatabaseItem {
  Time({int id = 0, required String name, String detail = ""})
      : super(id: id, name: name, detail: detail);
  Time.parse(Map<String, dynamic> json) : super.parse(json);
  @override
  Map<String, dynamic> toMap() => super.toMap();
}
