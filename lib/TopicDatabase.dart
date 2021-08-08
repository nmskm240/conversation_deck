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
          info TEXT, 
          affiliations TEXT,
          time TEXT
        )""");
  }

  @override
  Future<List<Topic>?> all() async {
    var db = await database;
    var datas = await db?.query(table);
    List<Topic> topics = [];
    datas?.forEach((data) => {topics.add(Topic.deserialize(data))});
    return topics;
  }
}
