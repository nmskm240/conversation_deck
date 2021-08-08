import 'package:conversation_deck/Database/DatabaseItem.dart';
import 'package:sqflite/sqflite.dart';
import 'Database/DatabaseProvider.dart';
import 'Time.dart';

class TimeDatabase extends DatabaseProvider<Time> {
  static final TimeDatabase _instance = TimeDatabase._constructor();
  TimeDatabase._constructor() {
    version = 1;
    table = "time";
  }

  factory TimeDatabase() => _instance;

  @override
  Future onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          detail TEXT
        )
        """);
    await db.insert(table, new Time(id: 0, name: "今日").serialize());
    await db.insert(table, new Time(id: 1, name: "昨日").serialize());
    await db.insert(table, new Time(id: 2, name: "今週").serialize());
    await db.insert(table, new Time(id: 3, name: "先週").serialize());
    await db.insert(table, new Time(id: 4, name: "今月").serialize());
    await db.insert(table, new Time(id: 5, name: "先月").serialize());
    await db.insert(table, new Time(id: 6, name: "今年").serialize());
  }

  @override
  Future<List<Time>?> all() async {
    var db = await database;
    var datas = await db?.query(table);
    List<Time> times = [];
    datas?.forEach((data) => {times.add(Time.deserialize(data))});
    return times;
  }
}