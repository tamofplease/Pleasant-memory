import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/auth/auth_bloc.dart';
import 'package:meple/blocs/auth/auth_state.dart';
import 'package:meple/blocs/user/user_bloc.dart';
import 'package:meple/blocs/user/user_event.dart';
import 'package:meple/helper/form.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/models/user.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {

  var count = 0;
  User user;
  SettingForm(this.user);
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {

  final _formKey = GlobalKey<FormState>();
  String _email;
  String _name;
  @override
  Widget build(BuildContext context) {
    User _user = widget.user;
    _email ??= _user.email;
    _name ??= _user.name;
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("設定"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.fromLTRB(60, 50, 60, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(_user.photoUrl),
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
                  onChanged: (val) => setState(() => _email = val),
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
                  onChanged: (val) => setState(() => _name = val),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    userBloc.add(UpdateUser(
                      user: User(
                        email: _email,
                        uid: _user.uid,
                        name: _name,
                        photoUrl: _user.photoUrl,
                        createdAt: _user.createdAt,
                        updatedAt: DateTime.now(),
                      ),
                    ));
                    // Navigator.pop(context);
                  },
                  child: Text("保存"),
                ),
              ],
            ),
          ),
        ),
      ),  
    );
  }
}
