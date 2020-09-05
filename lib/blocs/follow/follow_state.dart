import 'package:equatable/equatable.dart';

abstract class FollowState extends Equatable {
  FollowState([List props = const []]);
  List<Object> get props => [props];
}

class InitialFollowState extends FollowState {
  @override
  String toString() => "InitialFollowState";
}

class UserFindState extends FollowState {
  final String uid, uidTo;
  UserFindState(this.uid, this.uidTo);
  @override
  List<Object> get props => [uid, uidTo];
  @override
  String toString() => "UserFIndState";
}

class UserUnFindState extends FollowState {
  @override
  String toString() => "UserUnFindState";
}
