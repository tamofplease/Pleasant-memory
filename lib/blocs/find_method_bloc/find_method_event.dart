import 'package:equatable/equatable.dart';

abstract class FindMethodEvent extends Equatable {
  FindMethodEvent([List props = const []]);
  List<Object> get props => [props];
}

class ChangeFindMethodUserId extends FindMethodEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => "ChangeFindMethodUserId";
}

class ChangeFindMethodUserName extends FindMethodEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => "ChangeFindMethodUserName";
}
