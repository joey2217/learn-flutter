import 'package:flutter/material.dart';
import 'package:flutter_provider_app/states/count_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountModel>(create: (context) => CountModel()),
      ],
      child: const MaterialApp(
        title: 'ProviderApp',
        home: Counter(),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProviderApp')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${Provider.of<CountModel>(context).count}'),
          ElevatedButton(
              onPressed: context.read<CountModel>().add,
              child: const Text('ADD')),
          Text('${context.watch<CountModel>().count}'),
          ElevatedButton(
              onPressed: context.read<CountModel>().minus,
              child: const Text('MINUS')),
          Text('${context.read<CountModel>().count}'),
        ],
      ),
    );
  }
}
