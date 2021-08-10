import 'package:conversation_deck/Topic.dart';
import 'package:conversation_deck/TopicDatabase.dart';
import 'package:sqflite/sqflite.dart';
import 'Database/DatabaseProvider.dart';
import 'Deck.dart';

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
    await db.insert(table, new Deck(id: 0, name: "今日", topics: []).serialize());
    await db.insert(table, new Deck(id: 1, name: "昨日", topics: []).serialize());
    await db.insert(table, new Deck(id: 2, name: "今週", topics: []).serialize());
    await db.insert(table, new Deck(id: 3, name: "先週", topics: []).serialize());
    await db.insert(table, new Deck(id: 4, name: "今月", topics: []).serialize());
    await db.insert(table, new Deck(id: 5, name: "先月", topics: []).serialize());
    await db.insert(table, new Deck(id: 6, name: "今年", topics: []).serialize());
  }

  @override
  Future<List<Map<String, dynamic>>?> all() async {
    var datas = await super.all();
    if (datas == null || datas.isEmpty) {
      return null;
    }
    var decks = datas.map((data) {
      return Map.of(data);
    }).toList();
    decks.forEach((deck) async {
      if (deck.isEmpty || !deck.containsKey("topics")) {
        return;
      }
      var topics =
          deck["topics"].toString().split(Deck.separator).map((id) async {
        var topic = await TopicDatabase().getAt(int.tryParse(id) ?? 0);
        if (topic != null) {
          return Topic.deserialize(topic);
        }
      });
      deck["topics"] = topics;
    });
    return decks;
  }

  @override
  Future<Map<String, dynamic>?> getAt(int id) async {
    var data = await super.getAt(id);
    if (data == null || data.isEmpty || !data.containsKey("topics")) {
      return null;
    }
    var deck = Map.of(data);
    var topics =
        deck["topics"].toString().split(Deck.separator).map((id) async {
      var topic = await TopicDatabase().getAt(int.tryParse(id) ?? 0);
      if (topic != null) {
        return Topic.deserialize(topic);
      }
    });
    deck["topics"] = topics;
    return deck;
  }
}
