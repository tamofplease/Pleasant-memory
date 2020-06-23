import 'package:equatable/equatable.dart';


abstract class SignInState extends Equatable {
  SignInState([List props = const[]]);
  List<Object> get props => [props];
}

class SignInEmpty extends SignInState{}

class SignInLoading extends SignInState{}

class SignInSuccess extends SignInState{}

class SignInFailure extends SignInState{}
