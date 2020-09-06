import 'package:equatable/equatable.dart';
import 'package:meple/models/room.dart';

abstract class ChatOverEvent extends Equatable {
  @override
  ChatOverEvent([List props = const []]);
  List<Object> get props => [props];
}

class ChatOverInitialize extends ChatOverEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => "ChatOverInitialize";
}

class ChatOverLoading extends ChatOverEvent {
  final String uid;
  ChatOverLoading(this.uid);

  @override
  List<Object> get props => [uid];

  @override
  String toString() => "ChatOverLoading";
}

class MakeChatOverStateLoaded extends ChatOverEvent {
  final List<Room> rooms;
  MakeChatOverStateLoaded(this.rooms);

  @override
  List<Object> get props => [rooms];

  @override
  String toString() => "MakeChatOverStateLoaded";
}
