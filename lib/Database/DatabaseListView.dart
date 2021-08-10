import 'DatabaseListTile.dart';
import 'DatabaseProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseListView<T extends DatabaseProvider> extends StatelessWidget {
  final T database;

  const DatabaseListView({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database.all(),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return Text("データなし");
        }
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
        var datas = snapshot.data!;
        return ListView.builder(
          itemCount: datas.length,
          itemBuilder: (BuildContext context, int index) {
            return DatabaseListTile(data: datas[index]);
          },
        );
      },
    );
  }
}
