import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meple/models/user.dart';

abstract class UserEvent extends Equatable {
  UserEvent([List props = const[]]);
  List<Object> get props => [props];
}

class GetUserData extends UserEvent {
  final String uid;
  GetUserData(this.uid) 
  : assert(uid != null),
    super([uid]);
  @override
  String toString() => 'GetUserData';
}

class GetUser extends UserEvent {
  final User user;
  GetUser(this.user)
  : assert(user != null),
    super([user]);
}

class UpdateUser extends UserEvent{
  final User user;
  UpdateUser({
    @required this.user,
  })
  : assert(user != null),
    super([user]);
}


