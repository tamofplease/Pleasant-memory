import 'package:equatable/equatable.dart';

abstract class FindState extends Equatable {
  FindState([List props = const []]);
  List<Object> get props => [props];
}

class FinderRootState extends FindState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "FinderRootState";
}

class FinderPlaceState extends FindState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "FinderPlaceState";
}

class FinderUserState extends FindState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "FinderUserState";
}
