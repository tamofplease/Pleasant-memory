import 'package:equatable/equatable.dart';

abstract class FindEvent extends Equatable {
  FindEvent([List props = const []]);
  List<Object> get props => [props];
}

class FindRootEvent extends FindEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => "RootEvent";
}

class FindPlaceEvent extends FindEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => "PlaceEvent";
}

class FindUserEvent extends FindEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => "UserEvent";
}
