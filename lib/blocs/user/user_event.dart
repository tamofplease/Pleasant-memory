import 'package:equatable/equatable.dart';
import 'package:meple/models/current_user.dart';

abstract class UserEvent extends Equatable {
  UserEvent([List props = const[]]);
  List<Object> get props => [props];
}

class GetUserData extends UserEvent {
  final String uid;
  GetUserData(this.uid) 
  :assert(uid != null);
  @override
  String toString() => 'GetUserData';
}

class GetUser extends UserEvent {
  final CurrentUser currentUser;
  GetUser(this.currentUser);
}
