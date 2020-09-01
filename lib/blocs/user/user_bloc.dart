import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meple/blocs/image/image.dart';
import 'package:meple/blocs/user/user.dart';
import 'package:meple/models/user.dart';
import 'dart:io';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  StreamSubscription _todosSubscription;
  final ImageRepository _imageRepo;

  UserBloc(this._userRepository, this._imageRepo);

  @override
  get initialState => UserProgress();

  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUserData) {
      yield* _mapGetUserDataToState(event.uid);
    } else if (event is GetUser) {
      yield* _mapGetUserToState(event.user);
    } else if (event is UpdateUser) {
      yield* _mapUpdateUser(event.user);
    } else if (event is UpdateUserOfSetting) {
      yield* _mapUpdateUserOfSetting(event.user, event.imageInfo);
    }
  }

  Stream<UserState> _mapGetUserDataToState(String uid) async* {
    try {
      _todosSubscription = _userRepository.getUserData(uid).listen((user) {
        add(
          GetUser(user),
        );
      });
    } catch (e) {}
  }

  Stream<UserState> _mapGetUserToState(User user) async* {
    yield UserLoaded(user: user);
  }

  Stream<UserState> _mapUpdateUser(User user) async* {
    try {
      await _userRepository.updateUser(user);
      yield UserProgress();
    } catch (e) {
      yield UpdateFail();
    }
  }

  Stream<UserState> _mapUpdateUserOfSetting(
      User user, dynamic imageInfo) async* {
    try {
      if (imageInfo is File) {
        _imageRepo.uploadImageFromFile(imageInfo, user.uid).then((image) {
          add(UpdateUser(
            user: new User(
              email: user.email,
              uid: user.uid,
              name: user.name,
              photoUrl: image.toString() ?? user.photoUrl,
              createdAt: user.createdAt,
              updatedAt: DateTime.now(),
            ),
          ));
        });
      } else {
        add(UpdateUser(user: user));
      }
    } catch (e) {
      yield UpdateFail();
    }
  }

  void dispose() {
    _todosSubscription.cancel();
  }
}
