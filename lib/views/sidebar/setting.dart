import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popUntil(context, (route) {
          return count++ == 2;
        })
      ),
    );
  }
}