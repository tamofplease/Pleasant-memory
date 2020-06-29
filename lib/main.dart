import 'package:meple/blocs/auth/auth_bloc.dart';
import 'package:meple/blocs/auth/auth_state.dart';
import 'package:meple/blocs/auth/auth_event.dart';
import 'package:meple/blocs/drawer/drawer_bloc.dart';
import 'package:meple/helper/splash_screen.dart';
import 'package:meple/views/homes/home_screen.dart';
import 'blocs/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/views/auths/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  final authenticationRepository = FireBaseAuthenticationRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(authRepository: authenticationRepository)..add(AppStarted()),
        ),
        BlocProvider<DrawerBloc> (
          create: (context) => DrawerBloc(),
        ),
      ],
      child: MyApp(),
    ),
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
            return HomeScreen();
          }
          if(state is AuthenticationFailure) {
            return AuthPage();
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}