import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable{
  ImageEvent([List props = const[]]);
  List<Object> get props => [props];
}

class ImagePickEvent extends ImageEvent {
  @override
  String toString() => "Pick Image";
}