import 'package:flutter/material.dart';

class ComingSoonWithBtn extends StatelessWidget {
  final double heightRate;
  String backImg;
  ComingSoonWithBtn(this.heightRate,[this.backImg]);

  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        
      ),
       body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backImg ?? "assets/images/coming_soon.jpg"),
                  fit: BoxFit.cover,
                )
              ),
              child: Container(
                color: Colors.black54,
                height: (size.height * heightRate) - 76,
                child: Center(
                  child: ListWheelScrollView(
                    children: [
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.white,
                          // backgroundColor: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      
                    ],
                    itemExtent: 100,
                    diameterRatio: 1.5,
                  ),
                ),
              ),
            ),
          ],
      ),
       ),
    );
  }
}