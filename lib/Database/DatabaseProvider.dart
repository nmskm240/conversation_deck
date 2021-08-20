import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:conversation_deck/Database/Utils/Builder.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

abstract class DatabaseProvider<T extends DatabaseItem> {
  final String table;
  final int version;

  Database? _database;

  DatabaseProvider({required this.table, required this.version});

  Future<Database?> get database async {
    if (_database == null) _database = await _init();
    return _database;
  }

  Future<Database> _init() async {
    var dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, join(table, ".db"));
    return await openDatabase(path, version: version, onCreate: onCreate);
  }

  Future onCreate(Database db, int version);

  Future<List<T>> all() async {
    var db = await database;
    var datas = await db?.query(table);
    List<T> items = [];
    for (var data in datas!) {
      var item = Builder().make<T>(data);
      if (item != null) {
        await item.init(data);
        items.add(item);
      }
    }
    return items;
  }

  Future reset() async {
    var db = await database;
    if (db != null) {
      await deleteDatabase(db.path);
      _database = await _init();
    }
  }

  Future insert(T data) async {
    var db = await database;
    await db?.insert(table, data.toMap());
  }

  Future update(T data) async {
    var db = await database;
    await db
        ?.update(table, data.toMap(), where: 'id = ?', whereArgs: [data.id]);
  }

  Future deleteAt(int id) async {
    var db = await database;
    await db?.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<T?> getAt(int id) async {
    var db = await database;
    var match = await db?.query(table, where: "id = ?", whereArgs: [id]);
    if (0 < match!.length) {
      var data = match.first;
      var item = Builder().make<T>(data);
      await item!.init(data);
      return item;
    }
    return null;
  }

  Future<List<T>> getAts(Iterable<int> ids) async {
    var db = await database;
    var datas = await db?.query(table,
        where: "id IN (${ids.cast<String>().join(', ')})");
    List<T> items = [];
    for (var data in datas!) {
      var item = Builder().make<T>(data);
      if(item != null) {
        await item.init(data);
        items.add(item);
      }
    }
    return items;
  }
}
