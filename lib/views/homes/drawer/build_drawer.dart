import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/drawer/drawer_bloc.dart';
import 'package:meple/blocs/drawer/drawer_event.dart';
import 'package:meple/blocs/drawer/drawer_state.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/views/homes/drawer/drawer_clipper.dart';
import 'package:meple/views/homes/home_screen.dart';
import 'package:meple/views/sidebar/contact.dart';
import 'package:meple/views/sidebar/help.dart';
import 'package:meple/views/sidebar/profile.dart';
import 'package:meple/views/sidebar/setting.dart';


class BuildDrawer extends StatelessWidget {
  final CurrentUser currentUser;
  BuildDrawer({this.currentUser});
  
  @override
  Widget build(BuildContext context) {
    DrawerBloc drawerBloc = BlocProvider.of<DrawerBloc>(context);
    return BlocBuilder(
      bloc: drawerBloc,
      builder: (context, state) {

        if(state is HomeDrawerState) {
          Navigator.pop(context);
          
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return HomeScreen();
          // }));
        }

        if(state is ProfileDrawerState) {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Profile();
          }));
        }

        if(state is SettingDrawerState) {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Setting();
          }));
        }

        if(state is ContactDrawerState) {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Contact();
          }));
        }

        if(state is HelpDrawerState) {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Help();
          }));
        }

        if(state is NothingDrawerState) {}

        return ClipPath(
          clipper: DrawerClipper(),
          child: Drawer(
            child: Container(
              padding: const EdgeInsets.only(left: 16.0, right: 40),
              decoration: BoxDecoration(
                color: Colors.grey[300], boxShadow: [BoxShadow(color: Colors.black45)],
              ),
              width: 300,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      Container(
                        height: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.black, Colors.white],
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(currentUser.photoUrl),
                        ),
                      ),
                      GestureDetector(
                        child: Text("tap"),
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) {
                              return Setting();
                            }),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        currentUser.name,
                        style: TextStyle(color: Colors.black, fontSize: 22.0),
                      ),
                      Text(
                        currentUser.email,
                        style: TextStyle(color: Colors.black, fontSize: 22.0),
                      ),
                      SizedBox(height: 30.0),
                      _buildDivider(),
                      _buildRow(Icons.home, "ホーム",context,HomeDrawerEvent()),
                      _buildDivider(),
                      _buildRow(Icons.person_pin, "プロフィール", context,ProfileDrawerEvent()),
                      _buildDivider(),
                      _buildRow(Icons.settings, "設定",context,SettingDrawerEvent()),
                      _buildDivider(),
                      _buildRow(Icons.email, "コンタクト",context,ContactDrawerEvent()),
                      _buildDivider(),
                      _buildRow(Icons.info_outline, "ヘルプ",context,HelpDrawerEvent()),
                      _buildDivider(),
                    ],
                  )
                )
              ),
            ),
          ),
        );
      }
    );
        
  }
   

  Widget _buildRow(IconData iconData, String title, BuildContext context, DrawerEvent event) {
    DrawerBloc drawerBloc = BlocProvider.of<DrawerBloc>(context);
    return Container(
      child: ListTile(
        leading: Icon(
          iconData,
          size: 20,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 17.0),
        ),
        onTap: () {
          drawerBloc.add(event);
        },
        onLongPress: () {
          drawerBloc.add(event);
        },
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.grey,
    );
  }
} 