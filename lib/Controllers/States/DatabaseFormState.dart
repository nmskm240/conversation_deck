import 'package:conversation_deck/Controllers/DatabaseForm.dart';
import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:flutter/material.dart';

abstract class DatabaseFormState<T extends DatabaseItem>
    extends State<DatabaseForm> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  List<Widget> formBody = [];
  T? item;

  DatabaseFormState({this.item});

  void onComplete() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      onSaved();
    }
  }

  @protected
  void itemInit();
  @protected
  Future onSaved();
  @protected
  void createFormBody();

  @override
  void initState() {
    super.initState();
    itemInit();
    createFormBody();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Form(
          key: key,
          child: Column(
            children: formBody,
          ),
        ),
      ),
    );
  }
}
