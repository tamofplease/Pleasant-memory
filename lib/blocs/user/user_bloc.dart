
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/user/user_event.dart';
import 'package:meple/blocs/user/user_state.dart';
import 'package:meple/blocs/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
      yield* _mapGetUser(event);
    }
  }

  Stream<UserState> _mapGetUserData(String uid) async* {
    _todosSubscription?.cancel();
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

  Stream<UserState> _mapGetUser(GetUser event) async* {
    yield UserLoaded(event.currentUser);
  } 

}

