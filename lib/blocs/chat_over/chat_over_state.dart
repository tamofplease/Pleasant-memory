import 'package:equatable/equatable.dart';
import 'package:meple/models/user.dart';

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
  final List<User> users;
  ChatOverLoaded(this.users);
  @override
  List<Object> get props => [users];
}
