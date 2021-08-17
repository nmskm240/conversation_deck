import 'package:conversation_deck/Controllers/TopicForm.dart';
import 'package:conversation_deck/Database/TopicDatabase.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopicFormState extends State<TopicForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Topic? topic;

  TopicFormState(this.topic);

  void onComplete() {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      TopicDatabase().insert(topic!);
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
    if (topic == null) {
      topic = new Topic(name: "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                initialValue: topic!.name,
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
                  topic!.name = value!;
                },
              ),
              TextFormField(
                key: Key(topic!.when.toString()),
                initialValue: DateFormat.yMMMEd("ja").format(topic!.when),
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
                    topic!.when = picked!;
                  });
                },
              ),
              TextFormField(
                initialValue: topic!.where,
                decoration: const InputDecoration(
                  labelText: "どこで",
                ),
                onSaved: (value) {
                  topic!.where = value!;
                },
              ),
              TextFormField(
                initialValue: topic!.who,
                decoration: const InputDecoration(
                  labelText: "だれが",
                ),
                onSaved: (value) {
                  topic!.who = value!;
                },
              ),
              TextFormField(
                initialValue: topic!.whatUp,
                decoration: const InputDecoration(
                  labelText: "どうした",
                ),
                onSaved: (value) {
                  topic!.whatUp = value!;
                },
              ),
              TextFormField(
                initialValue: topic!.detail,
                decoration: const InputDecoration(
                  labelText: "詳細",
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textInputAction: TextInputAction.newline,
                onSaved: (value) {
                  topic!.detail = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
