import 'package:equatable/equatable.dart';
abstract class Event extends Equatable {
  Event([List props = const[]]);
  List<Object> get props => [props];
}

