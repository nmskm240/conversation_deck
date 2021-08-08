import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TimeDatabase.dart';
import 'Time.dart';
import 'TopicDatabase.dart';
import 'Topic.dart';
import 'TopicInfo.dart';
import 'LabeledTextField.dart';
import 'LabeledDropdown.dart';

class TopicForm extends StatefulWidget {
  @override
  _TopicFormState createState() => _TopicFormState();
}

class _TopicFormState extends State<TopicForm> {
  late Future<List<Time>?> _future;
  var _info = new TopicInfo();
  var _name = "";

  @override
  void initState() {
    super.initState();
    _future = TimeDatabase().all();
    _future.then((times) => _info.when = times!.first);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List<Time>?> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LabeledTextField(
                    label: 'タイトル',
                    hint: '内容を一言で表すと…',
                    onChanged: (text) => {_name = text},
                  ),
                  LabeledDropdown<Time>(
                    label: "いつ",
                    value: _info.when,
                    onChanged: (Time? newValue) {
                      setState(() {
                        _info.when = newValue ?? snapshot.data!.first;
                      });
                    },
                    items: snapshot.data?.map((Time time) {
                      return DropdownMenuItem<Time>(
                        child: Text(time.name),
                        value: time,
                      );
                    }).toList(),
                  ),
                  LabeledTextField(
                    label: 'どこで',
                    hint: '',
                    onChanged: (text) => {_info.where = text},
                  ),
                  LabeledTextField(
                    label: 'だれが',
                    hint: '',
                    onChanged: (text) => {_info.who = text},
                  ),
                  LabeledTextField(
                    label: 'なにを',
                    hint: '',
                    onChanged: (text) => {_info.what = text},
                  ),
                  LabeledTextField(
                    label: 'なぜ',
                    hint: '',
                    onChanged: (text) => {_info.why = text},
                  ),
                  LabeledTextField(
                    label: 'どのように',
                    hint: '',
                    onChanged: (text) => {_info.how = text},
                  ),
                  LabeledTextField(
                    label: 'どうした',
                    hint: '',
                    onChanged: (text) => {_info.whatUp = text},
                  ),
                  LabeledTextField(
                    label: '詳細',
                    hint: '具体的には…？',
                    onChanged: (text) => {_info.specifically = text},
                  ),
                  ElevatedButton(
                    child: Text('作成'),
                    onPressed: () {
                      if (_name.isEmpty) {
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
                        var card = new Topic(name: _name, info: _info);
                        TopicDatabase().insert(card);
                      }
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}