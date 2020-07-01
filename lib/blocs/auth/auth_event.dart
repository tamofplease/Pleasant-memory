import 'package:equatable/equatable.dart';
import 'package:meple/models/current_user.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const[]]);
  List<Object> get props => [props];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => "AppStarted";
}

class LoggedIn extends AuthenticationEvent {
  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}

