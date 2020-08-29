import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

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

class ChangeImageEvent extends DrawerEvent {
  final String uid;
  ChangeImageEvent(this.uid);

  List<Object> get props => [uid];
  @override
  String toString() => "ChangeImageEvent";
}

class PushImageEvent extends DrawerEvent {
  final PickedFile pickedFile;
  final String uid;
  PushImageEvent(this.pickedFile, this.uid);

  @override
  List<Object> get props => [pickedFile, uid];

  @override
  String toString() =>"PushImageEvent";
}

class ChangeDrawerImage extends DrawerEvent {
  final dynamic imageUrl;
  ChangeDrawerImage(this.imageUrl);
}
