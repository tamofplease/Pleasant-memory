import 'package:meple/models/current_user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const[]]);
  List<Object> get props => [props];
}

class AuthenticationInProgress extends AuthenticationState {
  @override
  String toString() => 'Unititialized';
}

class AuthenticationSuccess extends AuthenticationState {
  final CurrentUser currentUser;

  AuthenticationSuccess(this.currentUser) : super([currentUser]);

  @override
  String toString() => "AuthenticatonSuccess";
}

class AuthenticationFailure extends AuthenticationState {
  @override
  String toString() => 'AuthenticationFailure';
}



