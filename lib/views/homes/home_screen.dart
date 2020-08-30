import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:meple/blocs/auth/auth.dart';
// import 'package:meple/blocs/category/category_bloc.dart';
import 'package:meple/blocs/user/user.dart';
import 'package:meple/helper/helpers.dart';
import 'package:meple/models/user.dart';
import 'package:meple/views/homes/components/body.dart';
import 'package:meple/views/homes/drawer/build_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:meple/blocs/place/place.dart';
import 'package:meple/blocs/drawer/drawer.dart';


class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    User _user;
    final String uid = Provider.of<String>(context);
    return  BlocBuilder<UserBloc, UserState>(
      builder: (context, status){
        if(status is UpdateFail) {
        }
        if(status is UserProgress) {
          BlocProvider.of<UserBloc>(context).add(GetUserData(uid));
        }
        if(status is UserLoaded ){ 
          BlocProvider.of<DrawerBloc>(context).add(Initialize());
          _user = status.user;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: BlocBuilder<PlaceBloc, PlaceState>(
              builder: (context, state) {
                if(state is PlaceCreated){
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Scaffold.of(context)
                      ..showSnackBar(
                        SnackBar(content: Text(
                          "${state.place.name}を作成しました。"
                          ),
                          duration: Duration(seconds: 1 ),
                        ),
                      );
                  });
                    BlocProvider.of<PlaceBloc>(context).add(GetInitialPlace());
                  return Body();
                }
                return Body();
              }
            ),
            drawer: BuildDrawer(_user),
          );
        } 
        return SplashScreenWithBG();
      },
    );
  }


  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: appBarColor,
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {
            print("pressed_ Search Button");
          },
        ),
      ],
    );
  }
}

