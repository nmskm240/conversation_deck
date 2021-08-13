import 'DatabaseProvider.dart';
import 'Models/Topic.dart';
import 'Models/TopicInfo.dart';
import 'TopicInfoDatabase.dart';
import 'package:sqflite/sqflite.dart';

class TopicDatabase extends DatabaseProvider<Topic> {
  static final _instance = TopicDatabase._constructor();
  TopicDatabase._constructor() {
    table = "topic";
    version = 1;
  }

  factory TopicDatabase() => _instance;

  @override
  Future onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          detail TEXT, 
          count INTEGER, 
          time TEXT
        )""");
  }

  Future<Map<String, dynamic>?> _injectInfo(Map<String, dynamic>? data) async {
    if (data == null || data.isEmpty) {
      return null;
    }
    var topic = Map.of(data);
    var info = await TopicInfoDatabase().getAt(topic["id"]);
    topic.addAll({"info": TopicInfo.deserialize(info!)});
    return topic;
  }

  Future<List<Map<String, dynamic>>?> _parses(
      Iterable<Map<String, dynamic>>? datas) async {
    List<Map<String, dynamic>> topics = [];
    if (datas != null && datas.isNotEmpty) {
      for (var data in datas) {
        var topic = await _injectInfo(data);
        if (topic != null) {
          topics.add(topic);
        }
      }
    }
    return topics;
  }

  @override
  Future<List<Map<String, dynamic>>?> all() async {
    var datas = await super.all();
    return await _parses(datas);
  }

  @override
  Future reset() async {
    await TopicInfoDatabase().reset();
    return await super.reset();
  }

  @override
  Future<int?> insert(Topic data) async {
    await TopicInfoDatabase().insert(data.info);
    return await super.insert(data);
  }

  @override
  Future<int?> update(Topic data) async {
    await TopicInfoDatabase().update(data.info);
    return await super.update(data);
  }

  @override
  Future<int?> deleteAt(int id) async {
    await TopicInfoDatabase().deleteAt(id);
    return await super.deleteAt(id);
  }

  @override
  Future<Map<String, dynamic>?> getAt(int id) async {
    var data = await super.getAt(id);
    return await _injectInfo(data);
  }

  @override
  Future<List<Map<String, dynamic>>?> getAts(Iterable<int> ids) async {
    var datas = await super.getAts(ids);
    return await _parses(datas);
  }
}
