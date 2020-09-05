import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/drawer/drawer_event.dart';
import 'package:meple/blocs/user/user.dart';
import 'package:meple/helper/form.dart';
import 'package:meple/models/user.dart';
import 'package:meple/blocs/image/image.dart';
import 'dart:io';
import 'package:meple/blocs/drawer/drawer.dart';

class SettingForm extends StatefulWidget {
  final User user;
  SettingForm(this.user);
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _name;
  String _introduction;

  @override
  Widget build(BuildContext context) {
    User _user = widget.user;
    dynamic _profileImage;
    _profileImage ??= _user.photoUrl;
    _email ??= _user.email;
    _name ??= _user.name;
    _introduction ??= _user.introduction;
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
                BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
                  if (state is PickImageSuccess) {
                    _profileImage = state.image;
                    BlocProvider.of<ImageBloc>(context).add(ImageInitial());
                  }
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<ImageBloc>(context).add(
                        ImagePickEvent(),
                      );
                    },
                    child: Hero(
                      tag: "${_user.uid}__image",
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImage is File
                            ? FileImage(_profileImage)
                            : _profileImage == "assets/images/default.png"
                                ? AssetImage(_profileImage)
                                : NetworkImage(_profileImage),
                      ),
                    ),
                  );
                }),
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
                  validator: (val) => val.isEmpty ? "値を入力してください" : null,
                  initialValue: _user.name,
                  onChanged: (val) => setState(() => _name = val),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("編集"),
                    SizedBox(width: 10),
                    Icon(Icons.details),
                  ],
                ),
                TextFormField(
                  maxLines: null,
                  initialValue: _user.introduction,
                  onChanged: (val) => setState(() => _introduction = val),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    BlocProvider.of<DrawerBloc>(context)
                        .add(UpdatedImageProg());
                    BlocProvider.of<UserBloc>(context).add(UpdateUserOfSetting(
                      User(
                        email: _email,
                        uid: _user.uid,
                        name: _name,
                        photoUrl: _user.photoUrl,
                        createdAt: _user.createdAt,
                        updatedAt: DateTime.now(),
                      ),
                      _profileImage,
                    ));
                    Navigator.pop(context);
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
