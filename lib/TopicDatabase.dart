import 'package:conversation_deck/TopicInfo.dart';
import 'package:conversation_deck/TopicInfoDatabase.dart';

import 'Topic.dart';
import 'Database/DatabaseProvider.dart';
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
          affiliations TEXT,
          time TEXT
        )""");
  }

  @override
  Future<List<Map<String, dynamic>>?> all() async {
    var datas = await super.all();
    var topics = datas!.map((data) {
      return Map.of(data);
    }).toList();
    topics.forEach((topic) async {
      var info = await TopicInfoDatabase().getAt(topic["id"]);
      topic.addAll({
        "info": TopicInfo.deserialize(info!),
      });
    });
    return topics;
  }

  @override
  Future restore() async {
    await TopicInfoDatabase().restore();
    return await super.restore();
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
    var info = await TopicInfoDatabase().getAt(id);
    var data = await super.getAt(id);
    var topic = Map.of(data!);
    topic.addAll({"info": TopicInfo.deserialize(info!)});
    return topic;
  }
}
