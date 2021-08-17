import 'package:conversation_deck/Models/Time.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:conversation_deck/Models/TopicInfo.dart';
import 'package:conversation_deck/Database/TimeDatabase.dart';
import 'package:conversation_deck/Database/TopicDatabase.dart';
import 'package:conversation_deck/Views/LabeledDropdown.dart';
import 'package:conversation_deck/Views/LabeledTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicForm extends StatefulWidget {
  late final _TopicFormState state;

  TopicForm(Topic? topic) {
    if (topic == null) {
      state = _TopicFormState(title: "", info: new TopicInfo());
    } else {
      state =
          _TopicFormState(title: topic.name, info: topic.info, isUpdate: true);
    }
  }

  @override
  _TopicFormState createState() => state;
}

class _TopicFormState extends State<TopicForm> {
  late Future<List<Time?>> _future;
  final bool isUpdate;
  final TopicInfo info;
  String title;

  _TopicFormState(
      {required this.title, required this.info, this.isUpdate = false});

  @override
  void initState() {
    super.initState();
    _future = TimeDatabase().all();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List<Time?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!isUpdate) {
            info.when = snapshot.data!.first!;
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LabeledTextField(
                  text: title,
                  label: 'タイトル',
                  hint: '内容を一言で表すと…',
                  onChanged: (text) => {title = text},
                ),
                LabeledDropdown<Time>(
                  label: "いつ",
                  value: info.when,
                  onChanged: (Time? newValue) {
                    setState(() {
                      info.when = (newValue ?? snapshot.data!.first)!;
                    });
                  },
                  items: snapshot.data!.map((data) {
                    var time = (data!.id == info.when.id) ? info.when : data;
                    return DropdownMenuItem<Time>(
                      child: Text(time.name),
                      value: time,
                    );
                  }).toList(),
                ),
                LabeledTextField(
                  text: info.where,
                  label: 'どこで',
                  hint: '',
                  onChanged: (text) => {info.where = text},
                ),
                LabeledTextField(
                  text: info.who,
                  label: 'だれが',
                  hint: '',
                  onChanged: (text) => {info.who = text},
                ),
                LabeledTextField(
                  text: info.what,
                  label: 'なにを',
                  hint: '',
                  onChanged: (text) => {info.what = text},
                ),
                LabeledTextField(
                  text: info.why,
                  label: 'なぜ',
                  hint: '',
                  onChanged: (text) => {info.why = text},
                ),
                LabeledTextField(
                  text: info.how,
                  label: 'どのように',
                  hint: '',
                  onChanged: (text) => {info.how = text},
                ),
                LabeledTextField(
                  text: info.whatUp,
                  label: 'どうした',
                  hint: '',
                  onChanged: (text) => {info.whatUp = text},
                ),
                LabeledTextField(
                  text: info.specifically,
                  label: '詳細',
                  hint: '具体的には…？',
                  onChanged: (text) => {info.specifically = text},
                ),
                ElevatedButton(
                  child: Text('完了'),
                  onPressed: () {
                    if (title.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("エラー"),
                            content: Text("タイトルが入力されていません。"),
                            actions: <Widget>[
                              TextButton(
                                child: Text("OK"),
                                onPressed: () => {
                                  Navigator.pop(context),
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      var topic = new Topic(name: title, info: info);
                      if (isUpdate) {
                        TopicDatabase().update(topic);
                      } else {
                        TopicDatabase().insert(topic);
                      }
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
