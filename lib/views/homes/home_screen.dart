import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meple/blocs/auth/auth_bloc.dart';
import 'package:meple/blocs/auth/auth_event.dart';
import 'package:meple/blocs/category/category_bloc.dart';
import 'package:meple/views/homes/components/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocProvider<CategoryBloc>(
      create: (context) => CategoryBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(authBloc),
        body: Body(),
        // drawer: _buildDrawer(authBloc),
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

  // Drawer _buildDrawer(AuthenticationBloc authBloc) {
  //   // final String image = 
  //   return ;
  // }
}

