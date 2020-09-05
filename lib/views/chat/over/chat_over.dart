import 'package:flutter/material.dart';

class ChatOver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Object>(builder: (context, snapshot) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(child: Padding(child: Text("")));
        },
        itemCount: 3,
      );
    });
  }
}
