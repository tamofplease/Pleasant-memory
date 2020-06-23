import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {

  final heart = SpinKitPumpingHeart(
    color: Colors.red,
    size: 150.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:heart,
      ),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
      ),
    );
  }
} 