import 'package:flutter/material.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/views/homes/drawer/drawer_clipper.dart';



Widget buildDrawer(CurrentUser currentUser) {

  Widget _buildRow(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 30,
          ),
          SizedBox(width: 15.0),
          Text(
            title,
            style: TextStyle(fontSize: 17.0),
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.grey,
    );
  }

  final String image = currentUser.photoUrl;
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
                    backgroundImage: AssetImage(image),
                  ),
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
                _buildRow(Icons.home, "ホーム"),
                _buildDivider(),
                _buildRow(Icons.person_pin, "プロフィール"),
                _buildDivider(),
                _buildRow(Icons.settings, "設定"),
                _buildDivider(),
                _buildRow(Icons.email, "コンタクト"),
                _buildDivider(),
                _buildRow(Icons.info_outline, "ヘルプ"),
                _buildDivider(),
              ],
            )
          )
        ),
      )
    ),
  );
}

