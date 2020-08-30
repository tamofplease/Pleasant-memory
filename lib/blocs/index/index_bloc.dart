
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/index/index_event.dart';
import 'package:meple/blocs/index/index_state.dart';
import 'dart:async';
import 'package:meple/blocs/user/user.dart';




class IndexBloc extends Bloc<IndexEvent, IndexState> {
  final UserRepository _userRepository;
  StreamSubscription _todosSubscription;

  IndexBloc(this._userRepository);

  @override get initialState => InitialState();

  Stream<IndexState> mapEventToState(
    IndexEvent event,
  ) async* {
    if(event is GetUserImage) {
      yield* _mapGetUserImageToState(event.uid);
    }else if(event is ServeUserImage) {
      yield GottenUserImage(event.imageInfo);
    }
  }

  Stream<IndexState> _mapGetUserImageToState(String uid) async* {
    try {
      _todosSubscription = _userRepository.getUserData(uid).listen(
        (user) {
          add(ServeUserImage(user.profileWithBackgroundImage()));
        }
      );
    } catch(e) {
    }
  }


}

