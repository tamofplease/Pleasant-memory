import 'package:equatable/equatable.dart';
import 'package:meple/models/room.dart';

abstract class ChatOverState extends Equatable {
  @override
  ChatOverState([List props = const []]);
  List<Object> get props => [props];
}

class ChatOverInitial extends ChatOverState {
  @override
  String toString() => "ChatOverInitial";
}

class ChatOverLoaded extends ChatOverState {
  final List<Room> rooms;
  ChatOverLoaded(this.rooms);
  @override
  List<Object> get props => [rooms];
}
