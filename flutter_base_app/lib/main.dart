import 'package:flutter/material.dart';

import 'pages/animated_switcher_counter.dart';
import 'pages/animation_page.dart';
import 'pages/back_top.dart';
import 'pages/buttons.dart';
import 'pages/cart.dart';
import 'pages/checkbox_switch.dart';
import 'pages/constraints.dart';
import 'pages/container_box.dart';
import 'pages/custom_paint_page.dart';
import 'pages/darg_page.dart';
import 'pages/dialog.dart';
import 'pages/form_text_field.dart';
import 'pages/future_builder.dart';
import 'pages/hero_view.dart';
import 'pages/infinite_list_view.dart';
import 'pages/inherited.dart';
import 'pages/keep_alive_page_view.dart';
import 'pages/notice.dart';
import 'pages/page_view_page.dart';
import 'pages/progress.dart';
import 'pages/scaffold_route.dart';
import 'pages/scroll_notification.dart';
import 'pages/stagger_view.dart';
import 'pages/tab_view.dart';
import 'pages/theme.dart';
import 'pages/turn_box_page.dart';
import 'pages/value_listenable_page.dart';
import 'pages/will_pop_scope.dart';

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
        "/page_view": (context) => const PageViewPage(),
        "/keep_alive": (context) => const KeepAlivePageView(),
        "/tab_view": (context) => const TabViewPage(),
        "/will_pop": (context) => const WillPopScopePage(),
        "/inherited": (context) => const InheritedTestPage(),
        "/cart": (context) => const Cart(),
        "/theme": (context) => const ThemePage(),
        "/ValueListenable": (context) => const ValueListenablePage(),
        "/future_builder": (context) => const FutureBuilderPage(),
        "/DialogPage": (context) => const DialogPage(),
        "/DargPage": (context) => const DargPage(),
        "/notice": (context) => const NoticePage(),
        "/AnimationPage": (context) => const AnimationPage(),
        "/HeroView": (context) => const HeroView(),
        "/StaggerView": (context) => const StaggerView(),
        "/TurnBoxPage": (context) => const TurnBoxPage(),
        "/AnimatedSwitcherCounter": (context) =>
            const AnimatedSwitcherCounter(),
        "/CustomPaintPage": (context) => const CustomPaintPage(),

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
        body: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page_view");
              },
              child: const Text('page_view'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/keep_alive");
              },
              child: const Text('keep_alive'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/tab_view");
              },
              child: const Text('tab_view'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/will_pop");
              },
              child: const Text('will_pop'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/inherited");
              },
              child: const Text('inherited'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              child: const Text('cart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/theme");
              },
              child: const Text('theme'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/ValueListenable");
              },
              child: const Text('ValueListenable'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/future_builder");
              },
              child: const Text('future_builder'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/DialogPage");
              },
              child: const Text('DialogPage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/DargPage");
              },
              child: const Text('DargPage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/notice");
              },
              child: const Text('notice'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/AnimationPage");
              },
              child: const Text('AnimationPage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/HeroView");
              },
              child: const Text('HeroView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/StaggerView");
              },
              child: const Text('StaggerView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/AnimatedSwitcherCounter");
              },
              child: const Text('AnimatedSwitcherCounter'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/TurnBoxPage");
              },
              child: const Text('TurnBoxPage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/CustomPaintPage");
              },
              child: const Text('CustomPaint'),
            ),
          ],
        ));
  }
}
