import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FindState extends Equatable {
  FindState([List props = const []]);
  List<Object> get props => [props];
}

class FinderRoot extends FindState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "FinderRoot";
}

class FinderPlace extends FindState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "FinderPlace";
}

class FinderUser extends FindState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "FinderUser";
}
