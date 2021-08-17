import 'package:conversation_deck/Database/DatabaseProvider.dart';
import 'package:conversation_deck/Database/TopicInfoDatabase.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:sqflite/sqflite.dart';

class TopicDatabase extends DatabaseProvider<Topic> {
  static final _instance = TopicDatabase._constructor();
  TopicDatabase._constructor() : super(table: "topic", version: 1);

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
}
