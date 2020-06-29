import 'package:equatable/equatable.dart';

abstract class DrawerEvent extends Equatable  {
  DrawerEvent([List props = const[]]);
  List<Object> get props => [props];
}

class HomeDrawerEvent extends DrawerEvent {
  @override
  String toString() => "HomeDrawerEvent";
}

class ProfileDrawerEvent extends DrawerEvent {
  @override
  String toString() => "ProfileEvent";
}

class SettingDrawerEvent extends DrawerEvent {
  @override
  String toString() => "SettingEvent";
}

class ContactDrawerEvent extends DrawerEvent {
  @override
  String toString() => "ContactDrawerEvent";
}

class HelpDrawerEvent extends DrawerEvent {
  @override
  String toString() => "HelpDrawerEvent";
}

class NothingDrawerEvent extends DrawerEvent {
  @override
  String toString() => "NothingDrawerEvent";
}

