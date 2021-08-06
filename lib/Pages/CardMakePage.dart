import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../CardDatabase.dart';
import '../Time.dart';
import '../LabeledTextField.dart';
import '../TalkCard.dart';
import '../TalkDetail.dart';

class CardMakePage extends StatefulWidget {
  @override
  _CardMakePageState createState() => _CardMakePageState();
}

class _CardMakePageState extends State<CardMakePage> {
  var _title = '';
  var _talkDetail = new TalkDetail();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カード作成'),
        leading: IconButton(
          icon: Icon(Icons.arrow_left_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LabeledTextField(
                label: 'タイトル',
                hint: '内容を一言で表すと…',
                callback: (text) => {_title = text},
              ),
              DropdownButton<Time>(
                value: _talkDetail.when,
                onChanged: (Time? newValue) {
                  setState(() {
                    _talkDetail.when = newValue ?? Time.Today;
                  });
                },
                items: Time.values.map((Time type) {
                  return DropdownMenuItem<Time>(
                    value: type,
                    child: Text(TimeHelper.getValue(type)),
                  );
                }).toList(),
              ),
              LabeledTextField(
                label: 'どこで',
                hint: '',
                callback: (text) => {_talkDetail.where = text},
              ),
              LabeledTextField(
                label: 'だれが',
                hint: '',
                callback: (text) => {_talkDetail.who = text},
              ),
              LabeledTextField(
                label: 'なにを',
                hint: '',
                callback: (text) => {_talkDetail.what = text},
              ),
              LabeledTextField(
                label: 'なぜ',
                hint: '',
                callback: (text) => {_talkDetail.why = text},
              ),
              LabeledTextField(
                label: 'どのように',
                hint: '',
                callback: (text) => {_talkDetail.how = text},
              ),
              LabeledTextField(
                label: '詳細',
                hint: '具体的には…？',
                callback: (text) => {_talkDetail.other = text},
              ),
              ElevatedButton(
                child: Text('作成'),
                onPressed: () {
                  if (_title.isEmpty) {
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
                    var card = new TalkCard(_title, _talkDetail);
                    CardDatabase().insert(card);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
