import 'package:conversation_deck/Controllers/TopicForm.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicMake extends StatelessWidget {
  final Topic? topic;
  late final TopicForm? form;

  TopicMake({this.topic}) {
    form = TopicForm(topic: topic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カード編集'),
        leading: BackButton(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              form!.onComplete();
            },
          ),
        ],
      ),
      body: form,
    );
  }
}
