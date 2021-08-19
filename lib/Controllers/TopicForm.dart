import 'package:conversation_deck/Controllers/DatabaseForm.dart';
import 'package:conversation_deck/Controllers/States/TopicFormState.dart';
import 'package:conversation_deck/Models/Topic.dart';

class TopicForm extends DatabaseForm<Topic> {
  TopicForm({Topic? topic}){
    state = TopicFormState(topic);
  }
}
