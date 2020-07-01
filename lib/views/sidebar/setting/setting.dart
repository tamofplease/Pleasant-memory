import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/auth/auth_bloc.dart';
import 'package:meple/blocs/auth/auth_state.dart';
import 'package:meple/blocs/setting/setting_event.dart';
import 'package:meple/blocs/setting/setting_repository.dart';
import 'package:meple/blocs/setting/setting_state.dart';
import 'package:meple/helper/form.dart';
import 'package:meple/helper/splash_screen_with_background.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/views/sidebar/setting/setting_form.dart';
import 'package:provider/provider.dart';
import 'package:meple/blocs/setting/setting_bloc.dart';

class Setting extends StatelessWidget {

  CurrentUser currentUser;
  Setting(this.currentUser);
  
  @override
  Widget build(BuildContext context) {
    final SettingBloc settingBloc = BlocProvider.of<SettingBloc>(context);
    return BlocBuilder(
      bloc: settingBloc,
      builder: (context,status) {
        if(status is SettingProgress) {
          // return SplashScreenWithBG();
        }
        if(status is SettingSuccess) {
          currentUser = Provider.of<CurrentUser>(context);
        }

        if(status is SettingFailuer) {
        }
        
        if(status is SettingEmpty) {
        }
        return SettingForm(currentUser);
      } 
    );
  }
}

