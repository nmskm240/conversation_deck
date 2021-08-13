import 'DatabaseListTile.dart';
import 'DatabaseProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseListView<T extends DatabaseProvider> extends StatelessWidget {
  final Future<List<Map<String, dynamic>>?> future;
  final Function onTap;
  final Function onLongPress;

  const DatabaseListView(
      {Key? key,
      required this.future,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>?> snapshot) {
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
                return DatabaseListTile(
                  data: datas[index],
                  onTap: onTap,
                  onLongPress: onLongPress,
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
