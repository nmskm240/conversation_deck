import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:conversation_deck/Views/Data/SelectingData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatabaseListTile<T extends DatabaseItem> extends StatelessWidget {
  final T data;
  final void Function(T) onTap;
  final void Function(T)? onLongPress;

  DatabaseListTile({
    required this.data,
    required this.onTap,
    this.onLongPress,
  }) : super(key: ObjectKey(data));

  @override
  Widget build(BuildContext context) {
    final selectingData = Provider.of<SelectingData<T>>(context);
    return Ink(
      child: ListTile(
        title: Text(data.name),
        subtitle: Text(data.detail),
        selected: selectingData.isSelecting(data),
        selectedTileColor: Colors.grey,
        onTap: () {
          if (selectingData.isSelectingMode) {
            if (selectingData.isSelecting(data)) {
              selectingData.remove(data);
            } else {
              selectingData.add(data);
            }
          } else {
            onTap(data);
          }
        },
        onLongPress: () {
          if (!selectingData.isSelectingMode) {
            selectingData.add(data);
            selectingData.isSelectingMode = true;
            onLongPress!(data);
          }
        },
      ),
    );
  }
}
