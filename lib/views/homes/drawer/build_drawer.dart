import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/auth/auth.dart';
import 'package:meple/blocs/drawer/drawer.dart';
import 'package:meple/models/user.dart';
import 'package:meple/views/homes/drawer/drawer.dart';
import 'package:meple/views/sidebar/sidebar.dart';


class BuildDrawer extends StatelessWidget {
  final User user;
  BuildDrawer(this.user);
  @override
  Widget build(BuildContext context) {
    DrawerBloc drawerBloc = BlocProvider.of<DrawerBloc>(context);
    AuthenticationBloc authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return ClipPath(
      clipper: DrawerClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 5.0, right: 40),
          decoration: BoxDecoration(
            color: Colors.grey[300], boxShadow: [BoxShadow(color: Colors.black45)],
          ),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(0),
                    child: IconButton(
                      icon: Icon(Icons.dehaze),
                      onPressed: () => {
                        Navigator.pop(context),
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.red],
                      ),
                    ),
                    child: BlocBuilder<DrawerBloc, DrawerState>(
                      builder: (context, state) {
                        if(state is UpdatedImageState){
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<DrawerBloc>(context).add(ChangeImageEvent(user.uid));
                            }, 
                            child: Hero(
                              tag: "${user.uid}__image",
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: user.profileImage(),
                              ),
                            ),
                          );
                        } 
                        else if(state is UpdatedImageProgress){
                          return CircularProgressIndicator();
                        }
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<DrawerBloc>(context).add(ChangeImageEvent(user.uid));
                          }, 
                          child: Hero(
                            tag: "${user.uid}__image",
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: user.profileImage(),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    user.name,
                    style: TextStyle(color: Colors.black, fontSize: 22.0),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildDivider(),
                  GestureDetector(
                    child: _buildRow(Icons.home, "ホーム"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDivider(),
                  GestureDetector(
                    child: _buildRow(Icons.person_pin, "プロフィール"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Profile(user);
                      }));
                    },
                  ),
                  _buildDivider(),
                  GestureDetector(
                    child: _buildRow(Icons.settings, "設定"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Setting(user);
                        }));
                    },
                  ),
                  _buildDivider(),
                  GestureDetector(
                    child: _buildRow(Icons.email, "コンタクト"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Contact();
                        }));
                    },
                  ),
                  
                  _buildDivider(),
                  
                  GestureDetector(
                    child: _buildRow(Icons.info_outline, "ログアウト"),
                    onTap: () {
                      authBloc.add(LoggedOut());
                    },
                  ),
                    _buildDivider(),
                ],
              )
            )
          ),
        ),
      ),
    );
        
  }
   

  Widget _buildRow(IconData iconData, String title) {
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
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.grey,
    );
  }
} 