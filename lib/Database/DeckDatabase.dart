import 'package:conversation_deck/Database/DatabaseProvider.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:sqflite/sqflite.dart';

class DeckDatabase extends DatabaseProvider<Deck> {
  static final DeckDatabase _instance = DeckDatabase._constructor();
  DeckDatabase._constructor() : super(table: "deck", version: 1);

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
    await db.insert(table, new Deck(name: "今日", topics: []).toMap());
    await db.insert(table, new Deck(name: "昨日", topics: []).toMap());
    await db.insert(table, new Deck(name: "今週", topics: []).toMap());
    await db.insert(table, new Deck(name: "先週", topics: []).toMap());
    await db.insert(table, new Deck(name: "今月", topics: []).toMap());
    await db.insert(table, new Deck(name: "先月", topics: []).toMap());
    await db.insert(table, new Deck(name: "今年", topics: []).toMap());
  }
}
