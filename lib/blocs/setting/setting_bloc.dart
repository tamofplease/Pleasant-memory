
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/setting/setting_event.dart';
import 'package:meple/blocs/setting/setting_state.dart';
import 'package:meple/blocs/setting/setting_repository.dart';
import 'package:meple/blocs/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:meple/models/current_user.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {

  final SettingRepo settingRepo;

  SettingBloc(@required this.settingRepo);

  SettingState get initialState => SettingEmpty();

  @override
  Stream<SettingState> mapEventToState(SettingEvent event) async*{
    if(event is UpdateSetting) {
      yield* _mapUpdateUser(
        event.currentUser,
      );
    }
  }

  Stream<SettingState> _mapUpdateUser(CurrentUser currentUser) async* {
    yield SettingProgress();
    print(currentUser.name);
    try {
      await settingRepo.updateUser(currentUser);
      yield SettingSuccess(currentUser);
    }catch (e) {
      yield SettingFailuer();
    }
  }
}

