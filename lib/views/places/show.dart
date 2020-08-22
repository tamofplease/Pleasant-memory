import 'package:flutter/material.dart';
import 'package:meple/models/place.dart';

class ShowPlace extends StatelessWidget {
  final Place _place;
  ShowPlace(this._place);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("詳細"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                Text("名前:"),
                Text(_place.name),
              ],
            )
          ],
        )
      ),
    );
  }
}