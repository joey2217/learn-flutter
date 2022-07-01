import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("FormTextField"),
        ),
        body: FormWidget());
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey _key = GlobalKey<FormState>();
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: const InputDecoration(
                labelText: "username",
                hintText: "username",
                icon: Icon(Icons.person),
              ),
              validator: (text) {
                return text!.trim().isNotEmpty
                    ? null
                    : "Username cannot be empty!";
              },
            ),
            TextFormField(
              controller: _passController,
              decoration: const InputDecoration(
                labelText: "password",
                hintText: "password",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (text) {
                return text!.trim().length > 5
                    ? null
                    : "Password cannot be less than 6 digits !";
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    child: const Text("Login"),
                    onPressed: () {
                      if ((_key.currentState as FormState).validate()) {
                        print("validated!");
                        print("username:${_unameController.text}");
                        print("password:${_passController.text}");
                      }
                    },
                  ))
                ],
              ),
            )
          ],
        ));
  }
}
