import 'package:flutter/material.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/views/homes/drawer/drawer_clipper.dart';
import 'package:meple/views/sidebar/setting.dart';


class BuildDrawer extends StatelessWidget {
  final CurrentUser currentUser;
  BuildDrawer({this.currentUser});

  @override
  Widget build(BuildContext context) {
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
                  _buildRow(Icons.home, "ホーム",context),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "プロフィール", context),
                  _buildDivider(),
                  _buildRow(Icons.settings, "設定",context),
                  _buildDivider(),
                  _buildRow(Icons.email, "コンタクト",context),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "ヘルプ",context),
                  _buildDivider(),
                ],
              )
            )
          ),
        )
      ),
    );
  }
   

  Widget _buildRow(IconData iconData, String title, BuildContext context) {
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Setting();
            }) 
          );
        },
        onLongPress: () {

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