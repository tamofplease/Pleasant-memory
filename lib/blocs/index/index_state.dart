import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class IndexState extends Equatable {
  IndexState([List props = const[]]);
  List<Object> get props => [props];
}

class InitialState extends IndexState{
  List<Object> get props => [];
  @override
  String toString() => "initialState";
}

class GottenUserImage extends IndexState{
  final dynamic imageInfo;
  GottenUserImage(this.imageInfo);

  @override
  List<Object> get props => [imageInfo];

  @override
  String toString() => "GottenUserImage";
}
