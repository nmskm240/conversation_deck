import '../TalkCard.dart';
import 'Database/DatabaseProvider.dart';
import 'package:sqflite/sqflite.dart';

class CardDatabase extends DatabaseProvider<TalkCard> {
  static final _instance = CardDatabase._constructor();
  static CardDatabase get instance => _instance;
  CardDatabase._constructor() {
    version = 1;
    table = "cards";
  }

  @override
  Future onCreate(Database db, int version) async {
    var table = this.table;
    await db.execute("""CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          detail TEXT, 
          count INTEGER, 
          include TEXT, 
          time TEXT
        )""");
  }

  Future<List<TalkCard>?> all() async {
    var db = await database;
    var datas = await db?.query(this.table);
    List<TalkCard> cards = [];
    datas?.forEach((data) => {cards.add(TalkCard.deserialize(data))});
    return cards;
  }
}
