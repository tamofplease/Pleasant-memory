import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/find_user/find_user_repository.dart';
import './find_user.dart';

class FindUserBloc extends Bloc<FindUserEvent, FindUserState> {
  FindUserState get initialState => FindUserInitialState();
  StreamSubscription _findUserSubscription;
  final FindUserRepository _findUserRepo;

  FindUserBloc(this._findUserRepo);

  Stream<FindUserState> mapEventToState(
    FindUserEvent event,
  ) async* {
    if (event is FindUserSearchEvent) {
      yield* _mapFindUserSearchEventToState(event.search);
    } else if (event is FindUserSuccessEvent) {
      yield FindUserSuccess(event.user);
    }
  }

  Stream<FindUserState> _mapFindUserSearchEventToState(String uid) async* {
    try {
      _findUserSubscription =
          _findUserRepo.getUserDataFromUid(uid).listen((user) {
        add(
          FindUserSuccessEvent(user),
        );
      });
    } catch (e) {
      print("faild");
      yield FindUserFailuer();
    }
  }

  void dispose() {
    _findUserSubscription.cancel();
  }
}
