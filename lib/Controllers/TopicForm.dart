import 'package:conversation_deck/Controllers/States/TopicFormState.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicForm extends StatefulWidget {
  final Topic? topic;
  late final TopicFormState state;

  TopicForm({this.topic}){
    state = TopicFormState(topic);
  }

  void onComplete() => state.onComplete();

  @override
  TopicFormState createState() => state;
}
