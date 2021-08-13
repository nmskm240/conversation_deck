import 'package:conversation_deck/Models/Database/Models/Topic.dart';
import 'package:conversation_deck/Widgets/TopicForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicMake extends StatelessWidget {
  final Topic? topic;

  TopicMake({this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カード編集'),
        leading: BackButton(),
      ),
      body: TopicForm(topic),
    );
  }
}
