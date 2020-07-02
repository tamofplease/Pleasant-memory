
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/user/user_event.dart';
import 'package:meple/blocs/user/user_state.dart';
import 'package:meple/blocs/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:meple/models/current_user.dart';
import 'package:meple/models/user.dart';
import 'package:provider/provider.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  StreamSubscription _todosSubscription;

  UserBloc(this._userRepository);

  @override get initialState => UserProgress();

  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if(event is GetUserData) {
      yield * _mapGetUserData(event.uid);
    }else if(event is GetUser) {
      yield* _mapGetUser(event.user);
    }else if(event is UpdateUser) {
      yield* _mapUpdateUser(event.user);
    }
  }

  Stream<UserState> _mapGetUserData(String uid) async* {
    try {
      _todosSubscription = _userRepository.getUserData(uid).listen(
        (user) {
          add(
            GetUser(user),
          ); 
        }
      );
    } catch(e) {
    }
  }

  Stream<UserState> _mapGetUser(User user) async* {
    yield UserLoaded(user: user);
  } 

  Stream<UserState> _mapUpdateUser(User user) async* {
    yield UpdateProgress();
    try {
      await _userRepository.updateUser(user);
      yield UserProgress();
    }catch(e) {
      yield UpdateFail();
    }
  }

  void dispose() {
    _todosSubscription.cancel();
  }
}

