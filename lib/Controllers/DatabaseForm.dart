import 'package:conversation_deck/Controllers/States/DatabaseFormState.dart';
import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:flutter/cupertino.dart';

abstract class DatabaseForm<T extends DatabaseItem> extends StatefulWidget {
  late final DatabaseFormState state;

  DatabaseForm({T? item});

  void onComplete() => state.onComplete();

  @override
  DatabaseFormState createState() => state;
}
