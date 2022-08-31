import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_app/common/github_api.dart';
import 'package:github_app/common/utils.dart';
import 'package:github_app/generated/l10n.dart';
import 'package:github_app/models/index.dart';
import 'package:github_app/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final bool _nameAutoFocus = true;
  bool _showPassword = false;
  final TextEditingController _usernameController = TextEditingController()
    ..text = "";
  final TextEditingController _passwordController = TextEditingController()
    ..text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _usernameController,
                  decoration: InputDecoration(
                      labelText: S.of(context).userName,
                      hintText: S.of(context).userName,
                      prefixIcon: const Icon(Icons.person)),
                  validator: (value) {
                    return value == null || value.trim().isNotEmpty
                        ? null
                        : S.of(context).userNameRequired;
                  },
                ),
                TextFormField(
                  autofocus: !_nameAutoFocus,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: S.of(context).password,
                      helperText: S.of(context).password,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      )),
                  obscureText: !_showPassword,
                  validator: (value) {
                    return value == null || value.trim().isNotEmpty
                        ? null
                        : S.of(context).passwordRequired;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints.expand(height: 55),
                    child: ElevatedButton(
                      onPressed: _onLogin,
                      child: Text(S.of(context).login),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void _onLogin() async {
    if (_formKey.currentState!.validate()) {
      showLoading(context);
      User? user;
      try {
        user = await GithubApi(context)
            .login(_usernameController.text, _passwordController.text);
        if (!mounted) return;
        Provider.of<UserModel>(context, listen: false).user = user;
      } on DioError catch (e) {
        if (e.response?.statusCode == HttpStatus.unauthorized) {
          showToast(S.of(context).userNameOrPasswordWrong);
        } else {
          showToast(e.response!.statusCode.toString());
        }
      } finally {
        hideLoading(context);
      }
      if (user != null) {
        if (!mounted) return;
        Navigator.of(context).pop();
      }
    }
  }
}
