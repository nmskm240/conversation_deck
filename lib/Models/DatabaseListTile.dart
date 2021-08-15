import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseListTile<T extends DatabaseItem> extends StatelessWidget {
  final T? data;
  final void Function(T?) onTap;
  final void Function(T?) onLongPress;

  const DatabaseListTile({
    Key? key,
    required this.data,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(data!.name),
        subtitle: Text(data!.detail),
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
