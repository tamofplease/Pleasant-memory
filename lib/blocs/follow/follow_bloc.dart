import 'package:flutter_bloc/flutter_bloc.dart';
import 'follow.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  final FollowUserRepository _followRepo;

  FollowBloc(this._followRepo);

  @override
  get initialState => InitialFollowState();

  Stream<FollowState> mapEventToState(FollowEvent event) async* {
    if (event is CheckUserFollowd) {
      yield* _mapCheckUserFollowdToState(event.uid, event.uidTo);
    } else if (event is FollowUserEvent) {
      yield* _mapFollowUserEvent(event.uid, event.uidTo);
    } else if (event is UnFollowUserEvent) {
      yield* _mapUnFollowUserEvent(event.uid, event.uidTo);
    } else if (event is FindFollowUserEvent) {
      yield UserFindState(event.uid, event.uidTo);
    } else if (event is UnFindFollowUserEvent) {
      yield UserUnFindState();
    }
  }

  Stream<FollowState> _mapCheckUserFollowdToState(
      String uid, String uidTo) async* {
    //uidがuidToをフォローしているかのチェック
    try {
      _followRepo.getUserFollowingDataFromUid(uid, uidTo).listen((bool ans) {
        if (ans) {
          add(FindFollowUserEvent(uid, uidTo));
        } else {
          add(UnFindFollowUserEvent(uid, uidTo));
        }
      }).onError((e) => add(UnFindFollowUserEvent(uid, uidTo)));
    } catch (e) {
      yield UserUnFindState();
    }
  }

  Stream<FollowState> _mapFollowUserEvent(String uid, String uidTo) async* {
    try {
      await _followRepo.createUserFollowing(uid, uidTo);
      yield UserFindState(uid, uidTo);
    } catch (e) {}
  }

  Stream<FollowState> _mapUnFollowUserEvent(String uid, String uidTo) async* {
    try {
      await _followRepo.deleteUserFollowing(uid, uidTo);
      yield UserUnFindState();
    } catch (e) {}
  }
}
