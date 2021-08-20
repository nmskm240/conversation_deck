import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:conversation_deck/Models/DatabaseListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseListView<T extends DatabaseItem> extends StatelessWidget {
  final Future<List<T>> future;
  final void Function(T) onTap;
  final void Function(T) onLongPress;
  final void Function(T) onDismissed;

  const DatabaseListView(
      {Key? key,
      required this.future,
      required this.onTap,
      required this.onLongPress,
      required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<List<T>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text("エラー"),
                  content: Text("データベースへアクセス出来ませんでした。\n時間を置いてからもう一度試してください。"),
                  actions: <TextButton>[
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
            return Text("データベースにアクセス出来ませんでした。");
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            var datas = snapshot.data;
            return ListView.builder(
              itemCount: datas!.length,
              itemBuilder: (BuildContext context, int index) {
                var data = datas[index];
                return DatabaseListTile(
                  data: data,
                  onTap: onTap,
                  onLongPress: onLongPress,
                  onDismissed: onDismissed,
                );
              },
            );
          } else {
            return Text("データなし");
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
