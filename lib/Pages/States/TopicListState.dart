import 'package:conversation_deck/Models/Topic.dart';
import 'package:conversation_deck/Pages/TopicList.dart';
import 'package:conversation_deck/Views/DatabaseListView.dart';
import 'package:conversation_deck/Views/Models/DatabaseListTile.dart';
import 'package:flutter/material.dart';

abstract class TopicListState extends State<TopicList> {
  final AppBar appBar;
  Future<List<Topic>> future;

  TopicListState({required this.appBar, required this.future});

  @protected
  void onFloatingButtonPressed();
  @protected
  void onListTileTap(Topic topic);
  @protected
  void onListTileLongPress(Topic topic);
  @protected
  void update();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onFloatingButtonPressed,
      ),
      body: Container(
        alignment: Alignment.center,
        child: DatabaseListView<Topic>(
          future: future,
          itemBuilder: (Topic topic) {
            return DatabaseListTile<Topic>(
              data: topic,
              onTap: (Topic topic) => onListTileTap(topic),
              onLongPress: (Topic topic) => onListTileLongPress(topic),
            );
          },
        ),
      ),
    );
  }
}
