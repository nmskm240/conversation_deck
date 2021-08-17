import 'package:conversation_deck/Database/DatabaseProvider.dart';
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
          _when TEXT,
          _where TEXT,
          who TEXT,
          whatUp TEXT,
          count INTEGER
        )""");
  }
}
