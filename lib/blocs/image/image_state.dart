import 'package:equatable/equatable.dart';
import 'dart:io';
import 'package:multi_image_picker/multi_image_picker.dart';

abstract class ImageState extends Equatable {
  ImageState([List props = const[]]);
  List<Object> get props => [props];
}

class PickImageInitial extends ImageState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "PickImageInitial";
}

class PickImageProgress extends ImageState {
  @override
  List<Object> get props => [];
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
  List<Object> get props => [];

  @override
  String toString() => "PickImageFailure";
}

class BeforePickPlaceImages extends ImageState {

  @override
  List<Object> get props => [];
  @override
  String toString() => "BeforePickPlaceImages";
}

class PickedPlaceImages extends ImageState {
  final List<Asset> images;

  PickedPlaceImages(this.images);

  @override
  List<Object> get props => [images];

  @override
  String toString() =>"PickedPlaceImage";
}


class PickPlaceImagesFail extends ImageState {
  final String error;
  PickPlaceImagesFail(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "PickedPlaceImagesFail";
}


