import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showLoading(BuildContext context, {String text = "Loading..."}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ]),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          constraints: const BoxConstraints(minHeight: 120, minWidth: 180),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Navigator.of(context).pop();
}

void showToast(String text,
    {gravity = ToastGravity.CENTER, toastLength = Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      fontSize: 16);
}
