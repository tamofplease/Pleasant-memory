import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meple/models/current_user.dart';

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
  final CurrentUser currentUser;
  UserLoaded(this.currentUser) :super([currentUser]);
}