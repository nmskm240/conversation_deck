import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:conversation_deck/Views/Data/SelectingData.dart';
import 'package:conversation_deck/Views/Models/DatabaseListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatabaseListView<T extends DatabaseItem> extends StatelessWidget {
  final SelectingData<T> data = SelectingData<T>();
  final Future<List<T>> future;
  final DatabaseListTile Function(T) itemBuilder;

  DatabaseListView({
    Key? key,
    required this.future,
    required this.itemBuilder,
  }) : super(key: key);

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
            return ChangeNotifierProvider<SelectingData<T>>(
              create: (context) => data,
              child: ListView.builder(
                itemCount: datas!.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = datas[index];
                  var tile = itemBuilder(data);
                  return tile;
                },
              ),
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
