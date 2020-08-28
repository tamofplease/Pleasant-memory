import 'package:flutter/material.dart';
import 'package:meple/helper/google_map.dart';

class OnlyGoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GoogleMap"),
        centerTitle: true,
      ),
      body: CustomGoogleMap(),
    );
  }
}