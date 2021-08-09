import 'DatabaseItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseListTile extends StatelessWidget {
  final DatabaseItem item;

  const DatabaseListTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.detail),
    );
  }
}
