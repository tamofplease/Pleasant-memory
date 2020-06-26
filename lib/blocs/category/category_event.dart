import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  CategoryEvent([List porps = const[]]);
  List<Object> get props => [props];
}

class ChatEvent extends CategoryEvent {
  @override
  String toString() => "Chat";
}

class MemoryEvent extends CategoryEvent {
  @override
  String toString() => "Memory";
}

class FindEvent extends CategoryEvent {
  @override
  String toString() => "Find";
}