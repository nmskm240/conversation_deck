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

  Future<Map<String, dynamic>?> _timeUpdate(Map<String, dynamic>? data) async {
    if (data == null || data.isEmpty) {
      return null;
    }
    var info = Map.of(data);
    var time = await TimeDatabase().getAt(info["_when"] ?? 1);
    info.update("_when", (value) => Time.deserialize(time!));
    return info;
  }

  Future<List<Map<String, dynamic>>?> _parses(
      Iterable<Map<String, dynamic>>? datas) async {
    List<Map<String, dynamic>>? infos = [];
    if (datas != null && datas.isNotEmpty) {
      for(var data in datas) {
        var info = await _timeUpdate(data);
        if (info != null) {
          infos.add(info);
        }
      }
    }
    return infos;
  }

  @override
  Future<List<Map<String, dynamic>>?> all() async {
    var datas = await super.all();
    return await _parses(datas);
  }

  @override
  Future<Map<String, dynamic>?> getAt(int id) async {
    var data = await super.getAt(id);
    return await _timeUpdate(data);
  }

  @override
  Future<List<Map<String, dynamic>>?> getAts(Iterable<int> ids) async {
    var datas = await super.getAts(ids);
    return await _parses(datas);
  }
}
