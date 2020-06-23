import 'package:meple/blocs/bloc/auth_bloc.dart';
import 'package:meple/blocs/bloc/signin_bloc.dart';
import 'package:meple/blocs/event/auth_event.dart';
import 'package:meple/blocs/event/login_event.dart';
import 'package:meple/blocs/repository/signin_repository.dart';
import 'package:meple/blocs/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final signInBloc = SignInBloc(signInRepository: FirebaseSignInRepository());
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),

      body: BlocBuilder<SignInBloc, SignInState> (
        bloc: signInBloc,
        builder: (context, state) {
          if(state is SignInLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is SignInSuccess) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Success"),
                  RaisedButton(
                    onPressed: () {
                      
                      authenticationBloc.add(LoggedIn());
                    },
                    child: Text(
                      "startApp"
                    ),
                  )
                ],
              )
            );
          }
          
          if(state is SignInFailure) {
            return Center(
              child: Text("Failure"),
            );
          }
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RaisedButton.icon(
                  onPressed: () {
                    signInBloc.add(SignInAnonymouslyOnPressed());
                  },
                  icon: Icon(Icons.account_circle),
                  label: Text("Guest Login"),
                ),
                RaisedButton.icon(
                  onPressed: () {
                    signInBloc.add(SignInWithGoogleOnPressed());
                  },
                  icon: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  label: Text("LoginWith Google", 
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          );
        }
      )
    );
  }
}