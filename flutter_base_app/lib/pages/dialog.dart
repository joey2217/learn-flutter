import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  var includeChildren = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DialogPage"),
      ),
      body: const Center(
        child: Text('hFF'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("对话框2"),
        onPressed: () async {
          bool? delete = await showDeleteConfirmDialog(context);
          if (delete == null) {
            print("取消删除");
          } else {
            print("同时删除子目录: $delete");
          }
        },
      ),
    );
  }
}

Future<bool?> showDeleteConfirmDialog(BuildContext context) {
  bool _withTree = false;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("确定要删除当前文件吗?"),
              Row(
                children: [
                  const Text("同时删除子目录？"),
                  Builder(builder: ((context) {
                    return Checkbox(
                        value: _withTree,
                        onChanged: (bool? value) {
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        });
                  }))
                ],
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      });
}
