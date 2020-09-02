import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final double heightRate;
  final String backImg;
  ComingSoon(this.heightRate, [this.backImg]);

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(backImg ?? "assets/images/coming_soon.jpg"),
              fit: BoxFit.fill,
            )),
            child: Container(
              color: Colors.black54,
              // height: size.height * heightRate,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
