import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  UserEvent([List props = const[]]);
  List<Object> get props => [props];
}

class GetUser extends UserEvent {
  @override
  String toString() => "GetUser";
}