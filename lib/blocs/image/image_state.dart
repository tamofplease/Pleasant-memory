import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class ImageState extends Equatable {
  ImageState([List props = const[]]);
  List<Object> get props => [props];
}

class PickImageInitial extends ImageState {
  @override
  String toString() => "PickImageInitial";
}

class PickImageProgress extends ImageState {
  @override
  String toString() => "PickImageProgress";
}

class  PickImageSuccess extends ImageState { 
  final File image;
  PickImageSuccess(this.image);

  @override
  List<Object> get props => [image];
  @override
  String toString() => "PickImageSuccess";
}

class PickImageFailure extends ImageState {
  @override
  String toString() => "PickImageFailure";
}

