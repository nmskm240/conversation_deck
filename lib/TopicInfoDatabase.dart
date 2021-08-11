import 'package:conversation_deck/Database/DatabaseProvider.dart';
import 'package:conversation_deck/Time.dart';
import 'package:conversation_deck/TimeDatabase.dart';
import 'package:conversation_deck/TopicInfo.dart';
import 'package:sqflite/sqflite.dart';

class TopicInfoDatabase extends DatabaseProvider<TopicInfo> {
  static final _instance = TopicInfoDatabase._constructor();
  TopicInfoDatabase._constructor() {
    table = "topic_info";
    version = 1;
  }

  factory TopicInfoDatabase() => _instance;

  @override
  Future onCreate(Database db, int version) async {
    //when,whereは_がないとエラーが発生するため付与
    await db.execute("""CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          detail TEXT, 
          _when INTEGER,
          _where TEXT, 
          who TEXT,
          what TEXT,
          why TEXT,
          how TEXT,
          whatUp TEXT,
          specifically TEXT
        )""");
  }

  @override
  Future<List<Map<String, dynamic>>?> all() async {
    var datas = await super.all();
    if (datas == null || datas.isEmpty) {
      return null;
    }
    var infos = datas.map((data) {
      return Map.of(data);
    }).toList();
    infos.forEach((info) async {
      if (info.isEmpty) {
        return null;
      }
      var time = await TimeDatabase().getAt(info["_when"] ?? 0);
      info["_when"] = Time.deserialize(time!);
    });
    return infos;
  }

  @override
  Future<Map<String, dynamic>?> getAt(int id) async {
    var data = await super.getAt(id);
    if (data == null || data.isEmpty) {
      return null;
    }
    var info = Map.of(data);
    var time = await TimeDatabase().getAt(info["_when"] ?? 0);
    info["_when"] = Time.deserialize(time!);
    return info;
  }
}
