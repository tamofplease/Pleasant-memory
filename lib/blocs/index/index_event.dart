import 'package:equatable/equatable.dart';

abstract class IndexEvent extends Equatable {
  IndexEvent([List props = const[]]);
  List<Object> get props => [props];
}

class GetUserImage extends IndexEvent{
  final String uid;
  GetUserImage(this.uid);

  List<Object> get props => [uid];

  @override
  String toString() => "GetUserImage";
}
class ServeUserImage extends IndexEvent {
  final dynamic imageInfo;
  ServeUserImage(this.imageInfo);

  List<Object> get props => [imageInfo];

  @override
  String toString() => "ServeUserImage";
}