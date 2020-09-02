import 'package:flutter/material.dart';

class FinderErrorAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return Container();
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("警告"),
              content: Text("ユーザーが見つかりませんでした。"),
              actions: <Widget>[
                FlatButton(
                  child: const Text("OK"),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ));
  }
}
