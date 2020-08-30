import 'package:flutter/material.dart';
import 'package:meple/helper/form.dart';
import 'package:meple/models/user.dart';

class Profile extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final User _user;
  Profile(this._user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("プロフィール"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.fromLTRB(60, 50, 60, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "${_user.uid}__image",
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _user.profileImage(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("メールアドレス"),
                    SizedBox(width: 10),
                    Icon(Icons.email),
                  ],
                ),
                TextFormField(
                  cursorRadius: Radius.circular(100),
                  readOnly: true,
                  initialValue: _user.email,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("名前"),
                    SizedBox(width: 10),
                    Icon(Icons.person_outline),
                  ],
                ),
                TextFormField(
                  validator: (val) => val.isEmpty? "値を入力してください" : null,
                  initialValue: _user.name,
                  readOnly: true,
                ),
              ],
            )
          ),
        )
      )
    );
  }
}