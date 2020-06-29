import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("contact"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popUntil(context, (route) {
          return count++ == 2;
        })
      ),
    );
  }
}