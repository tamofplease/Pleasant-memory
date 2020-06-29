import 'package:flutter/material.dart';

class DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,0);
    path.lineTo(size.width - 40,0);
    path.quadraticBezierTo(size.width , size.height / 8, size.width - 40 , size.height / 2);
    path.quadraticBezierTo(size.width- 80.0, size.height - (size.height / 8) , size.width - 40 , size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}