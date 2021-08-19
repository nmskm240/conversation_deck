import 'package:conversation_deck/Controllers/States/DatabaseFormState.dart';
import 'package:conversation_deck/Database/DeckDatabase.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:conversation_deck/Pages/TopicList.dart';
import 'package:flutter/material.dart';

class DeckFormState extends DatabaseFormState<Deck> {
  DeckFormState(Deck? deck) : super(item: deck);

  @override
  void createFormBody() {
    formBody = [
      TextFormField(
        initialValue: item!.name,
        decoration: const InputDecoration(
          labelText: "タイトル",
        ),
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              value.replaceAll(RegExp(r'\s'), '').length == 0) {
            return 'タイトルは空欄にできません';
          }
          return null;
        },
        onSaved: (value) {
          item!.name = value!;
        },
      ),
      TextFormField(
        initialValue: item!.name,
        decoration: const InputDecoration(
          labelText: "概要",
        ),
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              value.replaceAll(RegExp(r'\s'), '').length == 0) {
            return '概要は空欄にできません';
          }
          return null;
        },
        keyboardType: TextInputType.multiline,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        onSaved: (value) {
          item!.detail = value!;
        },
      ),
    ];
  }

  @override
  Future onSaved() async {
    await DeckDatabase().insert(item!);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return TopicList(
            deck: item,
          );
        },
      ),
    );
  }

  @override
  void itemInit() {
    if (item == null) {
      item = Deck(name: "", topics: []);
    }
  }
}
