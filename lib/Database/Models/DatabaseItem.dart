abstract class DatabaseItem {
  int _id = 0;
  String name = "";
  String detail = "";

  int get id => _id;

  DatabaseItem({this.name = "", this.detail = ""});

  DatabaseItem.parse(Map<String, dynamic> obj) {
    _id = obj["id"];
    name = obj["name"];
    detail = obj["detail"];
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "detail": detail,
      };

  Future init(Map<String, dynamic> obj);
}
