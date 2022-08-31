import 'package:flutter/material.dart';
import 'package:github_app/generated/l10n.dart';
import 'package:github_app/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var localeModel = Provider.of<LocaleModel>(context);
    Widget _buildLanguageItem(String lang, String? value) {
      return ListTile(
        title: Text(
          lang,
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing: localeModel.locale == value
            ? Icon(
                Icons.done,
                color: color,
              )
            : null,
        onTap: () {
          localeModel.locale = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).language),
      ),
      body: ListView(
        children: [
          _buildLanguageItem("简体中文", "zh_CN"),
          _buildLanguageItem("English", "en"),
          _buildLanguageItem(S.of(context).auto, null),
        ],
      ),
    );
  }
}
