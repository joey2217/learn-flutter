import 'package:flutter/material.dart';

class CheckboxAndSwitch extends StatefulWidget {
  const CheckboxAndSwitch({Key? key}) : super(key: key);

  @override
  State<CheckboxAndSwitch> createState() => _CheckboxAndSwitchState();
}

class _CheckboxAndSwitchState extends State<CheckboxAndSwitch> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckboxAndSwitch"),
      ),
      body: Row(
        children: [
          const Text(
            "CheckboxAndSwitch",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Switch(
              value: _switchSelected,
              onChanged: (val) {
                setState(() {
                  _switchSelected = val;
                });
              }),
          Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.green,
              onChanged: (val) {
                setState(() {
                  _checkboxSelected = val!;
                });
              })
        ],
      ),
    );
  }
}
