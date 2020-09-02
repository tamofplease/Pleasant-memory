import 'package:equatable/equatable.dart';
import 'package:meple/models/user.dart';

abstract class FindUserState extends Equatable {
  FindUserState([List props = const []]);
  List<Object> get props => [props];
}

class FindUserInitialState extends FindUserState {
  @override
  String toString() => "FindUserInitial";
}

class FindUserSearchState extends FindUserState {
  final String searchString;
  FindUserSearchState(this.searchString);

  List<Object> get props => [searchString];

  @override
  String toString() => "FindUserSearch";
}

class FindUserFailuer extends FindUserState {
  List<Object> get props => [];

  @override
  String toString() => "FindUserFailuer";
}

class FindUserSuccess extends FindUserState {
  final User user;
  FindUserSuccess(this.user);
  List<Object> get props => [user];

  @override
  String toString() => "FindUserSuccess";
}
