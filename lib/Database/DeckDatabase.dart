import 'package:conversation_deck/Models/Deck.dart';
import 'DatabaseProvider.dart';
import 'package:sqflite/sqflite.dart';

class DeckDatabase extends DatabaseProvider<Deck> {
  static final DeckDatabase _instance = DeckDatabase._constructor();
  DeckDatabase._constructor() {
    version = 1;
    table = "deck";
  }

  factory DeckDatabase() => _instance;

  @override
  Future onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          detail TEXT,
          topics TEXT
        )
        """);
    await db.insert(table, new Deck(id: 0, name: "今日", topics: []).toMap());
    await db.insert(table, new Deck(id: 1, name: "昨日", topics: []).toMap());
    await db.insert(table, new Deck(id: 2, name: "今週", topics: []).toMap());
    await db.insert(table, new Deck(id: 3, name: "先週", topics: []).toMap());
    await db.insert(table, new Deck(id: 4, name: "今月", topics: []).toMap());
    await db.insert(table, new Deck(id: 5, name: "先月", topics: []).toMap());
    await db.insert(table, new Deck(id: 6, name: "今年", topics: []).toMap());
  }
}
