import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FindState extends Equatable {
  FindState([List props = const[]]);
  List<Object> get props => [props];
}
