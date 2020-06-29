import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("help"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popUntil(context, (route) {
          return count++ == 2;
        })
      ),
    );
  }
}