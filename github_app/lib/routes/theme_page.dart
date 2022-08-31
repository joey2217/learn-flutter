import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:github_app/common/global.dart';
import 'package:github_app/generated/l10n.dart';
import 'package:github_app/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).theme),
      ),
      body: ListView(
          children: Global.themes.map<Widget>((e) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: Container(
              color: e,
              height: 40,
            ),
          ),
          onTap: () {
            Provider.of<ThemeModel>(context, listen: false).theme = e;
          },
        );
      }).toList()),
    );
  }
}
