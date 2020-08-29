import 'package:equatable/equatable.dart';

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

class UpdatedImageState extends DrawerState{
  final dynamic imageUrl;
  UpdatedImageState(this.imageUrl);

  List<Object> get props => [imageUrl];
  @override
  String toString() =>  "ChangeImage";
}

class ChangeDrawerImageStateFail extends DrawerState{
  @override
  String toString() =>  "ChangeImage";
}

class UpdatedImageProgress extends DrawerState {
  @override
  String toString() => "UpdatedImageProgress";
}