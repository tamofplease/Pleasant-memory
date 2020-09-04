import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/find_user/find_user_repository.dart';
import './find_user.dart';
import 'package:meple/models/user.dart';

class FindUserBloc extends Bloc<FindUserEvent, FindUserState> {
  FindUserState get initialState => FindUserInitialState();
  StreamSubscription _findUserSubscription;
  final FindUserRepository _findUserRepo;

  FindUserBloc(this._findUserRepo);

  Stream<FindUserState> mapEventToState(
    FindUserEvent event,
  ) async* {
    if (event is FindUserByIdEvent) {
      yield* _mapFindUserSearchEventToState(event.search);
    } else if (event is FindUserSuccessEvent) {
      yield FindUserSuccess(event.user);
    } else if (event is FindUserInitialize) {
      yield FindUserInitialState();
    } else if (event is FindUserFailuerEvent) {
      yield FindUserFailuer();
    } else if (event is FindUserByNameEvent) {
      yield* _mapFindUserByNameEventToState(event.search);
    }
  }

  Stream<FindUserState> _mapFindUserSearchEventToState(String uid) async* {
    try {
      _findUserSubscription =
          _findUserRepo.getUserDataFromUid(uid).listen((user) {
        try {
          add(FindUserSuccessEvent(user));
        } catch (e) {}
      });
      _findUserSubscription.onError((e) => add(FindUserFailuerEvent()));
    } catch (e) {
      yield FindUserFailuer();
    }
  }

  Stream<FindUserState> _mapFindUserByNameEventToState(String name) async* {
    try {
      _findUserSubscription =
          _findUserRepo.getUserDataFromName(name).listen((user) {
        try {
          add(FindUserSuccessEvent(user));
        } catch (e) {}
      });
      _findUserSubscription.onError((e) => add(FindUserFailuerEvent()));
    } catch (e) {
      yield FindUserFailuer();
    }
  }

  void dispose() {
    _findUserSubscription.cancel();
  }
}
