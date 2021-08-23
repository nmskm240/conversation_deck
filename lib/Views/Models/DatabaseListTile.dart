import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseListTile<T extends DatabaseItem> extends StatefulWidget {
  final T data;
  final void Function(T) onTap;
  final void Function(T) onLongPress;
  bool isSelected = false;

  DatabaseListTile({
    required this.data,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: ObjectKey(data));

  @override
  _DatabaseListTileState createState() => _DatabaseListTileState(
        data: data,
        onTap: onTap,
        onLongPress: onLongPress,
      );
}

class _DatabaseListTileState extends State<DatabaseListTile> {
  var data;
  var onTap;
  var onLongPress;

  _DatabaseListTileState({
    required this.data,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: ListTile(
        title: Text(data.name),
        subtitle: Text(data.detail),
        selected: widget.isSelected,
        selectedTileColor: Colors.grey,
        onTap: () {
          onTap(data);
          setState(() {
            widget.isSelected = !widget.isSelected;
          });
        },
        onLongPress: () {
          onLongPress(data);
          setState(() {
            widget.isSelected = true;
          });
        },
      ),
    );
  }
}
