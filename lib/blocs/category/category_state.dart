import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  CategoryState([List props = const[]]);
  List<Object> get props => [props];
}

class SelectedChat extends CategoryState{}

class SelectedMemory extends CategoryState{}

class SelectedFind extends CategoryState{}