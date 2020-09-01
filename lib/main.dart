import 'package:flutter/material.dart';
import 'package:meple/blocs/index/index_bloc.dart';
import 'blocs/blocs.dart';
import 'package:meple/helper/splash_screen.dart';
import 'package:meple/views/homes/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/views/auths/auth.dart';
import 'simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  final authenticationRepository = FireBaseAuthenticationRepository();
  final userRepo = UserRepository();
  final placeRepo = PlaceRepository();
  final imageRepo = ImageRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(authRepository: authenticationRepository)
                ..add(AppStarted()),
        ),
        BlocProvider<DrawerBloc>(
          create: (context) => DrawerBloc(imageRepo, userRepo),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(userRepo, imageRepo),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider<ImageBloc>(
          create: (context) => ImageBloc(),
        ),
        BlocProvider<PlaceBloc>(
          create: (context) => PlaceBloc(placeRepo, imageRepo),
        ),
        BlocProvider<IndexBloc>(
          create: (context) => IndexBloc(userRepo),
        ),
        BlocProvider<FindBloc>(
          create: (context) => FindBloc(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (context, state) {
        if (state is AuthenticationInProgress) {
          return SplashScreen();
        }
        if (state is AuthenticationSuccess) {
          String uid = state.currentUser.uid;
          return Provider<String>.value(
            value: uid,
            child: MaterialApp(
              title: "Meple",
              theme: ThemeData(
                  primaryColor: Colors.indigo[900],
                  accentColor: Colors.pink[800],
                  brightness: Brightness.light),
              routes: {
                '/': (context) {
                  return new Builder(builder: (BuildContext context) {
                    return HomeScreen();
                  });
                },
              },
            ),
          );
        }
        if (state is AuthenticationFailure) {
          return AuthPage();
        } else {
          return Container();
        }
      },
    );
  }
}
