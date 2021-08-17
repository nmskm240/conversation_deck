import 'package:conversation_deck/Database/DatabaseProvider.dart';
import 'package:conversation_deck/Models/Time.dart';
import 'package:sqflite/sqflite.dart';

class TimeDatabase extends DatabaseProvider<Time> {
  static final TimeDatabase _instance = TimeDatabase._constructor();
  TimeDatabase._constructor() : super(table: "time", version: 1);

  factory TimeDatabase() => _instance;

  @override
  Future onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          detail TEXT
        )
        """);
    await db.insert(table, new Time(name: "今日").toMap());
    await db.insert(table, new Time(name: "昨日").toMap());
    await db.insert(table, new Time(name: "今週").toMap());
    await db.insert(table, new Time(name: "先週").toMap());
    await db.insert(table, new Time(name: "今月").toMap());
    await db.insert(table, new Time(name: "先月").toMap());
    await db.insert(table, new Time(name: "今年").toMap());
  }
}
