import 'Database/DatabaseItem.dart';

class Time extends DatabaseItem {
  Time({int id = 0, required String name, String detail = ""})
      : super(id: id, name: name, detail: detail);
  Time.deserialize(Map<String, dynamic> json) : super.deserialize(json);
  @override
  Map<String, dynamic> serialize() => super.serialize();
}
