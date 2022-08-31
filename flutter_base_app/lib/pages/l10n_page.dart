import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class L10nPage extends StatelessWidget {
  const L10nPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageHomeConfirm),
      ),
      body: Column(
        children: [
          Text(S.of(context).pageHomeWelcome("John")),
          Text(S.of(context).pageHomeWelcomeGender("male")),
          Text(S.of(context).pageHomeWelcomeRole("admin")),
          Text(S.of(context).pageNotificationsCount(5)),
        ],
      ),
    );
  }
}
