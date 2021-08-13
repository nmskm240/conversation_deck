import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseListTile extends StatelessWidget {
  final Map<String, dynamic> data;
  final Function onTap;
  final Function onLongPress;

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
        title: Text(data["name"]),
        subtitle: Text(data["detail"]),
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
