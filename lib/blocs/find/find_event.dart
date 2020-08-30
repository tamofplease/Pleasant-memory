import 'package:equatable/equatable.dart';

abstract class FindEvent extends Equatable {
  FindEvent([List props = const[]]);
  List<Object> get props => [props];
}

