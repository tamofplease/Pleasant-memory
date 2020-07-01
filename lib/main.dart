import 'package:meple/blocs/auth/auth_bloc.dart';
import 'package:meple/blocs/auth/auth_state.dart';
import 'package:meple/blocs/auth/auth_event.dart';
import 'package:meple/blocs/drawer/drawer_bloc.dart';
import 'package:meple/blocs/user/user_bloc.dart';
import 'package:meple/blocs/user/user_repository.dart';
import 'package:meple/helper/splash_screen.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/views/homes/home_screen.dart';
import 'package:provider/provider.dart';
import 'blocs/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/views/auths/auth.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  final authenticationRepository = FireBaseAuthenticationRepository();
  final userRepo = CurrentUserRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(authRepository: authenticationRepository)..add(AppStarted()),
        ),
        BlocProvider<DrawerBloc> (
          create: (context) => DrawerBloc(),
        ),
        BlocProvider<UserBloc> (
          create: (context) => UserBloc(userRepo),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: "Meple",
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        accentColor: Colors.pink[800],
        brightness: Brightness.light
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (context, state) { 
          if(state is AuthenticationInProgress) {
            
          }
          if(state is AuthenticationSuccess) {
            String uid = state.currentUser.uid;
            return Provider<String>.value (
              value: uid,
              child: HomeScreen(),
            );
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