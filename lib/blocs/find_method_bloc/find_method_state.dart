import 'package:equatable/equatable.dart';

abstract class FindMethodState extends Equatable {
  FindMethodState([List props = const []]);
  List<Object> get props => [props];
}

class FindMethodAsUserId extends FindMethodState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "FindMethodAsUserId";
}

class FindMethodAsUserName extends FindMethodState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "FindMethodAsUserName";
}
