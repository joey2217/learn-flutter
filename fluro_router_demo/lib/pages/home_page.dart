import 'package:flutter/material.dart';

import '../router/application.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Container(
              child: GridView.count(
            crossAxisCount: 2,
            children: [
              Container(
                child: FlatButton(
                    onPressed: () {
                      Application.router.navigateTo(context, '/native');
                    },
                    child: Icon(Icons.nature)),
                color: Colors.amber[600],
              )
            ],
          )),
        ),
      ),
    );
  }
}
