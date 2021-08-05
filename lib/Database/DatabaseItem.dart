abstract class DatabaseItem {
  var _id = 0;
  var _name = "";
  var _detail = "";

  int get id => _id;
  String get name => _name;
  String get detail => _detail;

  set id(int i) => {_id = i};
  set name(String s) => {_name = s};
  set detail(String s) => {_detail = s};

  DatabaseItem();
  DatabaseItem.deserialize(Map<String, dynamic> obj);
  Map<String, dynamic> serialize();
}
