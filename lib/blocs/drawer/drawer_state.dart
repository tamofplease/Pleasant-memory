import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DrawerState extends Equatable {
  DrawerState([List props = const []]);
  List<Object> get props => [props];
}


class HomeDrawerState extends DrawerState {
  @override
  String toString() => "HomeDrawerState";
}

class ProfileDrawerState extends DrawerState {
  @override
  String toString() => "ProfileState";
}

class SettingDrawerState extends DrawerState {
  @override
  String toString() => "SettingState";
}

class ContactDrawerState extends DrawerState {
  @override
  String toString() => "ContactDrawerState";
}

class HelpDrawerState extends DrawerState {
  @override
  String toString() => "HelpDrawerState";
}

class NothingDrawerState extends DrawerState {
  @override
  String toString() => "Nothing";
}