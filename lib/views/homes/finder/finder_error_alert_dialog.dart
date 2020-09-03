import 'package:flutter/material.dart';
import 'package:meple/blocs/find_user/find_user_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/find_user/find_user.dart';

class FinderErrorAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FindUserBloc>(context).add(FindUserInitialize());
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
