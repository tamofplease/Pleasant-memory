import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignInEvent extends Equatable{
  SignInEvent([List props = const []]);
  List<Object> get props => [props];
}

class SignInWithGoogleOnPressed extends SignInEvent{}


class SignInAnonymouslyOnPressed extends SignInEvent{}

class SignInWithEmailAndPassword extends SignInEvent{
  final String email;
  final String password;
  SignInWithEmailAndPassword({
    @required this.email,
    @required this.password,
  }): assert(email != null),
      assert(password != null);

  @override
  List<Object> get props => [email, password];

  String toString() => "SignIn with email: $email password: $password";
}

class CreateUserWithEmailAndPassword extends SignInEvent {
  final String email;
  final String password;
  CreateUserWithEmailAndPassword({
    @required this.email,
    @required this.password,
  }): assert(email != null),
      assert(password != null);

  @override
  List<Object> get props => [email, password];
  String toString() => "createUser with email: $email password: $password";
}