import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("profile"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popUntil(context, (route) {
          return count++ == 2;
        })
      ),
    );
  }
}