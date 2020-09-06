import 'package:equatable/equatable.dart';

abstract class FollowEvent extends Equatable {
  FollowEvent([List props = const []]);

  List<Object> get props => [props];
}

class CheckUserFollowd extends FollowEvent {
  final String uid, uidTo;
  CheckUserFollowd(this.uid, this.uidTo);

  @override
  List<Object> get props => [uid, uidTo];

  @override
  String toString() => "CheckUserFollowd";
}

class FindFollowUserEvent extends FollowEvent {
  final String uid, uidTo;
  FindFollowUserEvent(this.uid, this.uidTo);

  @override
  List<Object> get props => [uid, uidTo];

  @override
  String toString() => "FindFollowUserEvent";
}

class UnFindFollowUserEvent extends FollowEvent {
  final String uid, uidTo;
  UnFindFollowUserEvent(this.uid, this.uidTo);

  @override
  List<Object> get props => [uid, uidTo];

  @override
  String toString() => "UnFindFollowUserEvent";
}

class FollowUserEvent extends FollowEvent {
  final String uid, uidTo, photoUrl, name;
  FollowUserEvent(this.uid, this.uidTo, this.name, this.photoUrl);

  @override
  List<Object> get props => [uid, uidTo];

  @override
  String toString() => "FollowUserEvent";
}

class UnFollowUserEvent extends FollowEvent {
  final String uid, uidTo;
  UnFollowUserEvent(this.uid, this.uidTo);

  @override
  List<Object> get props => [uid, uidTo];

  @override
  String toString() => "FollowUserEvent";
}
