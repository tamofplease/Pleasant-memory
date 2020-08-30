import 'package:equatable/equatable.dart';

abstract class FindUserEvent extends Equatable {
  FindUserEvent([List props = const[]]);
  List<Object> get props => [props];
}

