import 'package:equatable/equatable.dart';

abstract class ImageState extends Equatable {
  ImageState([List props = const[]]);
  List<Object> get props => [props];
}

class PickImageProgress extends ImageState {
  @override
  String toString() => "PickImageProgress";
}

class  PickImageSuccess extends ImageState {
  @override
  String toString() => "PickImageSuccess";
}

