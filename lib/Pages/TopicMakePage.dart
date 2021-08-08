import 'package:conversation_deck/TopicForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicMakePage extends StatelessWidget {
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
      body: new TopicForm(),
    );
  }
}
