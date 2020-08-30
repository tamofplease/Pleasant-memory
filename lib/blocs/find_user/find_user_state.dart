import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FindUserState extends Equatable {
  State([List props = const[]]);
  List<Object> get props => [props];
}
