import 'package:flutter/material.dart';

import 'pages/back_top.dart';
import 'pages/buttons.dart';
import 'pages/checkbox_switch.dart';
import 'pages/constraints.dart';
import 'pages/container_box.dart';
import 'pages/form_text_field.dart';
import 'pages/infinite_list_view.dart';
import 'pages/progress.dart';
import 'pages/scaffold_route.dart';
import 'pages/scroll_notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/buttons": (context) => const Buttons(),
        "/checkboxandswitch": (context) => const CheckboxAndSwitch(),
        "/formtextfield": (context) => const FormTextField(),
        "/progress": (context) => const Progress(),
        "/constraints": (context) => const Constraints(),
        "/container_box": (context) => const ContainerBox(),
        "/scaffold": (context) => const ScaffoldRoute(),
        "/list_view": (context) => const InfiniteListView(),
        "/back_top": (context) => const BackTop(),
        "/scroll_notification": (context) =>
            const ScrollNotificationTestRoute(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/buttons");
            },
            child: const Text('buttons'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/checkboxandswitch");
            },
            child: const Text('CheckboxAndSwitch'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/formtextfield");
            },
            child: const Text('FormTextField'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/progress");
            },
            child: const Text('Progress'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/constraints");
            },
            child: const Text('Constraints'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/container_box");
            },
            child: const Text('ContainerBox'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/scaffold");
            },
            child: const Text('scaffold'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/list_view");
            },
            child: const Text('ListView'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/back_top");
            },
            child: const Text('BackTop'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/scroll_notification");
            },
            child: const Text('scroll_notification'),
          ),
        ],
      )),
    );
  }
}
