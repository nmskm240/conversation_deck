import 'package:conversation_deck/Controllers/States/DatabaseFormState.dart';
import 'package:conversation_deck/Database/TopicDatabase.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopicFormState extends DatabaseFormState<Topic> {
  TopicFormState(Topic? topic) : super(item: topic);

  @override
  Future onSaved() async {
    if (item!.id == 0) {
      await TopicDatabase().insert(item!);
    } else {
      await TopicDatabase().update(item!);
    }
    Navigator.of(context).pop();
  }

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
        key: Key(item!.when.toString()),
        initialValue: DateFormat.yMMMEd("ja").format(item!.when),
        decoration: const InputDecoration(
          labelText: "いつ",
        ),
        readOnly: true,
        onTap: () async {
          final picked = await showDatePicker(
            locale: const Locale("ja"),
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
          );
          setState(() {
            item!.when = picked!;
          });
        },
      ),
      TextFormField(
        initialValue: item!.where,
        decoration: const InputDecoration(
          labelText: "どこで",
        ),
        onSaved: (value) {
          item!.where = value!;
        },
      ),
      TextFormField(
        initialValue: item!.who,
        decoration: const InputDecoration(
          labelText: "だれが",
        ),
        onSaved: (value) {
          item!.who = value!;
        },
      ),
      TextFormField(
        initialValue: item!.whatUp,
        decoration: const InputDecoration(
          labelText: "どうした",
        ),
        onSaved: (value) {
          item!.whatUp = value!;
        },
      ),
      TextFormField(
        initialValue: item!.detail,
        decoration: const InputDecoration(
          labelText: "詳細",
        ),
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
  void itemInit() {
    if (item == null) {
      item = new Topic(name: "");
    }
  }
}
