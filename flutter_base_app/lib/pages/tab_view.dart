import 'package:flutter/material.dart';

import 'keep_alive_page_view.dart';

class TabViewPage extends StatelessWidget {
  const TabViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List tabs = ["新闻", "历史", "图片"];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabViewPage"),
          bottom: TabBar(
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: tabs
              .map((e) => KeepAliveWrapper(
                      child: Center(
                    child: Text(
                      e,
                      textScaleFactor: 5,
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}

// class TabViewPage extends StatefulWidget {
//   const TabViewPage({Key? key}) : super(key: key);

//   @override
//   State<TabViewPage> createState() => _TabViewPageState();
// }

// class _TabViewPageState extends State<TabViewPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   List tabs = ["news", "history", "picture"];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: tabs.length, vsync: this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("TabViewPage"),
//         bottom: TabBar(
//           tabs: tabs
//               .map((e) => Tab(
//                     text: e,
//                   ))
//               .toList(),
//           controller: _tabController,
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: tabs
//             .map((e) => KeepAliveWrapper(
//                   child: Center(
//                     child: Text(
//                       e,
//                       textScaleFactor: 5,
//                     ),
//                   ),
//                 ))
//             .toList(),
//       ),
//     );
//   }
// }
