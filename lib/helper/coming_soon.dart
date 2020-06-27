import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final double heightRate;
  String backImg;
  ComingSoon(this.heightRate,[this.backImg]);

  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * heightRate,
          child: Center(
            child: Text(
              "Coming Soon",
              style: TextStyle(
                color: Colors.white,
                // backgroundColor: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backImg ?? "assets/images/coming_soon.jpg"),
              fit: BoxFit.fill,
            )
          )
        ),
      ],
    );
  }
}