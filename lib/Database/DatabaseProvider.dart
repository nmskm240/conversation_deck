import 'DatabaseItem.dart';
import 'IDeserializable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

abstract class DatabaseProvider<T extends DatabaseItem> {
  static final _name = "conversation_deck.db";
  static int version = 1;
  static String table = "";

  static Database? _database;
  Future<Database?> get database async {
    if (_database == null) _database = await _init();
    return _database;
  }

  Future<Database> _init() async {
    var dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, _name);
    return await openDatabase(path, version: version, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {}

  Future<int?> insert(T data) async {
    var db = await database;
    return await db?.insert(table, data.serialize());
  }

  Future<List<T>?> all() async {
    var db = await database;
    var datas = await db?.query(table);
    List<T> cards = [];
    datas?.forEach(
        (data) => {cards.add(IDeserializable.deserialize(data) as T)});
    return cards;
  }

  Future<int?> update(T data) async {
    var db = await database;
    return await db?.update(table, data.serialize(),
        where: 'id = ?', whereArgs: [data.id]);
  }

  Future<int?> delete(int id) async {
    var db = await database;
    return await db?.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
