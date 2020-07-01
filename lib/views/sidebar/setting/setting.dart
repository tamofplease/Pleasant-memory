import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/auth/auth_bloc.dart';
import 'package:meple/blocs/auth/auth_state.dart';
import 'package:meple/helper/form.dart';
import 'package:meple/helper/splash_screen_with_background.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/views/sidebar/setting/setting_form.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {

  CurrentUser currentUser;
  Setting(this.currentUser);
  
  @override
  Widget build(BuildContext context) {
    return SettingForm(currentUser);
  }
}

