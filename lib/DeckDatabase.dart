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

  Future<Map<String, dynamic>?> _topicsRestore(
      Map<String, dynamic>? data) async {
    if (data == null || data.isEmpty) {
      return null;
    }
    var deck = Map.of(data);
    List<Topic> topics = [];
    deck["topics"].toString().split(Deck.separator).forEach((id) async {
      var topic = await TopicDatabase().getAt(int.tryParse(id) ?? -1);
      if (topic != null) {
        topics.add(Topic.deserialize(topic));
      }
    });
    deck["topics"] = topics;
    return deck;
  }

  Future<List<Map<String, dynamic>>?> _parses(
      Iterable<Map<String, dynamic>>? datas) async {
    List<Map<String, dynamic>> decks = [];
    if (datas != null && datas.isNotEmpty) {
      for(var data in datas) {
        var deck = await _topicsRestore(data);
        if (deck != null) {
          decks.add(deck);
        }
      }
    }
    return decks;
  }

  @override
  Future<List<Map<String, dynamic>>?> all() async {
    var datas = await super.all();
    return await _parses(datas);
  }

  @override
  Future<Map<String, dynamic>?> getAt(int id) async {
    var data = await super.getAt(id);
    return await _topicsRestore(data);
  }

  @override
  Future<List<Map<String, dynamic>>?> getAts(Iterable<int> ids) async {
    var datas = await super.getAts(ids);
    return await _parses(datas);
  }
}
