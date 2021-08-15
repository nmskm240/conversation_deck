abstract class DatabaseItem {
  late int _id;
  late String _name;
  late String _detail;

  int get id => _id;
  String get name => _name;
  String get detail => _detail;

  DatabaseItem({int id = 0, String name = "", String detail = ""}) {
    _id = id;
    _name = name;
    _detail = detail;
  }

  DatabaseItem.parse(Map<String, dynamic> obj) {
    _id = obj["id"];
    _name = obj["name"];
    _detail = obj["detail"];
  }

  Map<String, dynamic> toMap() => {
        "name": _name,
        "detail": _detail,
      };

  Future init(Map<String, dynamic> obj);
}
