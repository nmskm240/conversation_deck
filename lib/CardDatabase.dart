import '../TalkCard.dart';
import 'Database/DatabaseProvider.dart';
import 'package:sqflite/sqflite.dart';

class CardDatabase extends DatabaseProvider<TalkCard> {
  static final version = 1;
  static final table = "cards";

  static final _instance = CardDatabase._constructor();
  static CardDatabase get instance => _instance;
  CardDatabase._constructor();

  @override
  Future onCreate(Database db, int version) async {
    await db.execute(
        """CREATE TABLE $table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, detail TEXT)
    """);
  }
}
