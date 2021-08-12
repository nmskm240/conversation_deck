import 'DatabaseItem.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

abstract class DatabaseProvider<T extends DatabaseItem> {
  late final String table;
  late final int version;

  Database? _database;
  Future<Database?> get database async {
    if (_database == null) _database = await _init();
    return _database;
  }

  Future<Database> _init() async {
    var dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, join(table, ".db"));
    return await openDatabase(path, version: version, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {}

  Future<List<Map<String, dynamic>>?> all() async {
    var db = await database;
    return await db?.query(table);
  }

  Future reset() async {
    var db = await database;
    if (db != null) {
      await deleteDatabase(db.path);
      _database = await _init();
    }
  }

  Future<int?> insert(T data) async {
    var db = await database;
    return await db?.insert(table, data.serialize());
  }

  Future<int?> update(T data) async {
    var db = await database;
    return await db?.update(table, data.serialize(),
        where: 'id = ?', whereArgs: [data.id]);
  }

  Future<int?> deleteAt(int id) async {
    var db = await database;
    return await db?.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<Map<String, dynamic>?> getAt(int id) async {
    var db = await database;
    var match = await db?.query(table, where: "id = ?", whereArgs: [id]);
    return match!.length == 0 ? null : match.first;
  }

  Future<List<Map<String, dynamic>>?> getAts(Iterable<int> ids) async {
    var db = await database;
    return await db?.query(table,
        where: "id IN (${ids.join(', ')})");
  }
}
