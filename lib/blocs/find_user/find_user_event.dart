import 'package:equatable/equatable.dart';
import 'package:meple/models/user.dart';

abstract class FindUserEvent extends Equatable {
  FindUserEvent([List props = const []]);
  List<Object> get props => [props];
}

class FindUserByIdEvent extends FindUserEvent {
  final String search;
  FindUserByIdEvent(this.search);
  @override
  List<Object> get props => [search];
  @override
  String toString() => "FindUserSearchEvent";
}

class FindUserByNameEvent extends FindUserEvent {
  final String search;
  FindUserByNameEvent(this.search);
  @override
  List<Object> get props => [search];
  @override
  String toString() => "FindUserByNameEvent";
}

class FindUserSuccessEvent extends FindUserEvent {
  final User user;
  FindUserSuccessEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => "FindUserSuccessEvent";
}

class FindUserInitialize extends FindUserEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => "FindUserInitialize";
}

class FindUserFailuerEvent extends FindUserEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => "FindUserFailuerEvent";
}
