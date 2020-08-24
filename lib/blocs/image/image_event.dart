import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable{
  ImageEvent([List props = const[]]);
  List<Object> get props => [props];
}

class ImageInitial extends ImageEvent {
  @override
  String toString() => "image initial";
}

class ImagePickEvent extends ImageEvent {
  @override
  String toString() => "Pick Image";
}

class PickPlaceImages extends ImageEvent {
  @override
  String toString() => "PickPlaceImage";
}

class ImagesToFirebase extends ImageEvent {
  @override
  String toString() => "ImagesToFirebase";
}
