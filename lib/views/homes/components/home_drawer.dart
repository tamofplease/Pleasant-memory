import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/auth/auth_bloc.dart';
import 'package:meple/blocs/auth/auth_event.dart';
import 'package:meple/blocs/auth/auth_state.dart';
import 'package:meple/models/current_user.dart';

class HomeDrawer extends StatelessWidget {
  CurrentUser _currentUser;
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authBloc = BlocProvider.of<AuthenticationBloc>(context);
    authBloc.add(GetCurrentUser());
    return BlocBuilder(
      bloc: authBloc,
      builder: (context,state) {
        print(state);
        if(state is GetCurrentUserState) {
          _currentUser = state.currentUser;
          print(_currentUser.uid);
        }else if(state is AuthenticationSuccess){
          print(state.currentUser);
          return Container();
        }
      }
    );
  }
}