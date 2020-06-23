import 'package:meple/blocs/bloc/auth_bloc.dart';
import 'package:meple/blocs/state/auth_state.dart';
import 'package:meple/blocs/event/auth_event.dart';
import 'package:meple/helper/splash_screen.dart';
import 'package:meple/views/signinscreen.dart';
import 'blocs/repository/auth_repository.dart';
import 'package:meple/views/eventList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/views/auths/auth.dart';

void main() {
  final authenticationRepository = FireBaseAuthenticationRepository();
  runApp(BlocProvider<AuthenticationBloc> (
    create: (context) => 
      AuthenticationBloc(authRepository: authenticationRepository)
        ..add(AppStarted()),
        child: MyApp(),
    ) 
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: "Awase",
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        accentColor: Colors.pink[800],
        brightness: Brightness.light
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (context, state) { 
          if(state is AuthenticationInProgress) {
            return SplashScreen();
          }
          if(state is AuthenticationSuccess) {
            return EventList();
          }
          if(state is AuthenticationFailure) {
            // return SignInScreen();
            return AuthPage();
          }
          else {
            print(state);
            return Container();
          }
          
        },
      ),
    );
  }
}