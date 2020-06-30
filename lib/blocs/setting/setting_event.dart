import 'package:equatable/equatable.dart';
import 'package:meple/views/sidebar/setting.dart';
import 'package:flutter/material.dart';
import 'package:meple/models/current_user.dart';

abstract class SettingEvent extends Equatable {
  SettingEvent([List props = const[]]);
  List<Object> get props => [props];
}

class UpdateSetting extends SettingEvent {
  final CurrentUser currentUser;
  UpdateSetting({
    @required this.currentUser
  })
  :assert(currentUser != null);
}