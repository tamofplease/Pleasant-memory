import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  UserState([List props = const []]);
  List<Object> get props => [props];
}


class GetUserProgress extends UserState {
  @override
  String toString() => "GetUserProgress";
}

class GetUserFailure extends UserState {
  @override
  String toString() => "GetUserFailure";
}

class GetUserSuccess extends UserState {
  @override
  String toString() => "GetUserSuccess";
}

