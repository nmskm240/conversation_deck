import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseListTile<T extends DatabaseItem> extends StatelessWidget {
  final T? data;
  final void Function(T?) onTap;
  final void Function(T?) onLongPress;
  final void Function(T?) onDismissed;

  const DatabaseListTile({
    Key? key,
    required this.data,
    required this.onTap,
    required this.onLongPress,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Dismissible(
        key: Key(data!.id.toString()),
        direction: DismissDirection.endToStart,
        child: ListTile(
          title: Text(data!.name),
          subtitle: Text(data!.detail),
        ),
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 0.0),
            child: Icon(
              Icons.delete, 
              color: Colors.white,
            ),
          ),
        ),
        confirmDismiss: (direction) async {
          return direction == DismissDirection.endToStart;
        },
        onDismissed: (direction) {
          onDismissed(data);
        },
      ),
      onTap: () {
        onTap(data);
      },
      onLongPress: () {
        onLongPress(data);
      },
    );
  }
}
