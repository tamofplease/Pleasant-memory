import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:meple/models/user.dart';

abstract class UserState extends Equatable {
  UserState([List props = const[]]);
  List<Object> get props => [props];
}

class UserProgress extends UserState {
  @override
  String toString() {
    return "userProgress";
  }
}

class UserLoaded extends UserState{
  final User user;
  UserLoaded({@required this.user}) 
  : assert(user != null);

  @override
  List<Object>  get props => [user];
  
  @override 
  String toString() => "UserLoaded";
}

class UpdateFail extends UserState {
}