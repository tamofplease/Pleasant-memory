import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meple/models/current_user.dart';

abstract class SettingState extends Equatable {
  SettingState([List props = const[]]);
  List<Object> get props => [props];
}

class SettingProgress extends SettingState {
}

class SettingSuccess extends SettingState {
  @override
  String toString() => "SettingSuccess";
}

class SettingFailuer extends SettingState {
}

class SettingEmpty extends SettingState {

}
