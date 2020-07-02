import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meple/models/current_user.dart';
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
  : assert(user != null),
    super([user]);
    
  @override 
  String toString() => "UserLoaded";
}

class UpdateProgress extends UserState {
}

class UpdateDone extends UserState {
}

class UpdateFail extends UserState {

}