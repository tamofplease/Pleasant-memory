import 'package:flutter/material.dart';
import 'package:meple/models/user.dart';
import 'package:meple/views/sidebar/setting/setting_form.dart';


class Setting extends StatelessWidget {

  User user;
  Setting(this.user);
  
  @override
  Widget build(BuildContext context) {
    return SettingForm(user);
  }
}

