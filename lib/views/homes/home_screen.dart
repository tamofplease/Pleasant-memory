import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meple/blocs/auth/auth_bloc.dart';
import 'package:meple/blocs/auth/auth_event.dart';
import 'package:meple/blocs/auth/auth_state.dart';
import 'package:meple/blocs/category/category_bloc.dart';
import 'package:meple/blocs/user/user_bloc.dart';
import 'package:meple/blocs/user/user_event.dart';
import 'package:meple/blocs/user/user_state.dart';
import 'package:meple/helper/form.dart';
import 'package:meple/helper/splash_screen_with_background.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/views/homes/components/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/views/homes/drawer/build_drawer.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    CurrentUser _currentUser;
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    final userBloc = BlocProvider.of<UserBloc>(context);
    final String uid = Provider.of<String>(context);
    return BlocProvider<CategoryBloc>(
      create: (context) => CategoryBloc(),
      child: BlocBuilder(
        bloc: userBloc,
        builder: (context, status){
          if(status is UpdateProgress) {
            print("a");
          }
          if(status is UpdateDone) {
            print("b");
          }
          if(status is UpdateFail) {
            print("e");
          }
          if(status is UserProgress) {
            userBloc.add(GetUserData(uid));
          }
          if(status is UserLoaded ){ 
            _currentUser = status.currentUser;
            return Provider<CurrentUser>.value(
              value: _currentUser,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar(authBloc),
                body: Body(),
                drawer: BuildDrawer(),
              ),
            );
          }
          
          
          
          return SplashScreenWithBG();
          
        },
      ),
    );
  }


  AppBar buildAppBar(AuthenticationBloc authBloc) {
    return AppBar(
      backgroundColor: appBarColor,
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

