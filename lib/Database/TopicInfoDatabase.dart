import 'package:conversation_deck/Models/TopicInfo.dart';
import 'DatabaseProvider.dart';
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
}
