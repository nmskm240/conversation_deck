import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseListTile extends StatelessWidget {
  final Map<String, dynamic> data;

  const DatabaseListTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data["name"]),
      subtitle: Text(data["detail"]),
    );
  }
}
