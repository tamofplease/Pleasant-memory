import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meple/blocs/auth/auth_bloc.dart';
import 'package:meple/blocs/auth/auth_event.dart';
import 'package:meple/blocs/auth/auth_state.dart';
import 'package:meple/blocs/category/category_bloc.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/views/homes/components/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/views/homes/drawer/build_drawer.dart';


class HomeScreen extends StatelessWidget {
  CurrentUser _currentUser;
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocProvider<CategoryBloc>(
      create: (context) => CategoryBloc(),
      child: BlocBuilder(
        bloc: authBloc,
        builder: (context, status){
          if(status is AuthenticationSuccess) {
            _currentUser = status.currentUser;
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(authBloc),
            body: Body(),
            drawer: BuildDrawer(currentUser: _currentUser),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(AuthenticationBloc authBloc) {
    return AppBar(
      backgroundColor: Colors.blueGrey[600],
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {
            authBloc.add(LoggedOut());
          },
        ),
      ],
    );
  }

 
}

