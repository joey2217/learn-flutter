import 'package:flutter/material.dart';

Future<String> mockNetworkData() async {
  return Future.delayed(const Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

Stream<int> counter() {
  return Stream.periodic(const Duration(seconds: 1), (i) => i);
}

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureBuilder"),
      ),
      body: Column(
        children: [
          FutureBuilder<String>(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Text("Data: ${snapshot.data}");
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
            future: mockNetworkData(),
          ),
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('没有Stream');
                case ConnectionState.waiting:
                  return const Text('等待数据...');
                case ConnectionState.active:
                  return Text('active: ${snapshot.data}');
                case ConnectionState.done:
                  return const Text('Stream 已关闭');
              }
            },
            // initialData: null, a Stream<int> or null
            stream: counter(),
          )
        ],
      ),
    );
  }
}
