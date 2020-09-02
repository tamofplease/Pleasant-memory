import 'package:flutter/material.dart';
import 'package:meple/blocs/signin/signin.dart';
import 'package:bloc/bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository _signInRepository;

  SignInBloc({@required SignInRepository signInRepository})
      : assert(signInRepository != null),
        _signInRepository = signInRepository;

  @override
  SignInState get initialState => SignInEmpty();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInWithGoogleOnPressed) {
      yield* _mapSignInWithGoogleOnPressed();
    }
    if (event is SignInAnonymouslyOnPressed) {
      yield* _mapSignInAnonymouslyOnPressed();
    }
    if (event is SignInWithEmailAndPassword) {
      yield* _mapSignInWithEmailAndPassword(
        event.email,
        event.password,
      );
    }
    if (event is CreateUserWithEmailAndPassword) {
      yield* _mapCreateUserWithEmailAndPassword(
        event.email,
        event.password,
      );
    }
  }

  Stream<SignInState> _mapSignInWithGoogleOnPressed() async* {
    yield SignInLoading();
    try {
      await _signInRepository.signInWithGoogle();
      yield SignInSuccess();
    } catch (_) {
      yield SignInFailure();
    }
  }

  Stream<SignInState> _mapSignInAnonymouslyOnPressed() async* {
    yield SignInLoading();
    try {
      await _signInRepository.signInAnonymously();
      yield SignInSuccess();
    } catch (_) {
      yield SignInFailure();
    }
  }

  Stream<SignInState> _mapSignInWithEmailAndPassword(
      String email, String password) async* {
    yield SignInLoading();
    try {
      await _signInRepository.signInWithEmailAndPassword(email, password);
      yield SignInSuccess();
    } catch (_) {
      yield SignInFailure();
    }
  }

  Stream<SignInState> _mapCreateUserWithEmailAndPassword(
      String email, String password) async* {
    yield SignInLoading();
    try {
      await _signInRepository.createUserWithEmailAndPassword(email, password);
      yield SignInSuccess();
    } catch (_) {
      yield SignInFailure();
    }
  }
}
