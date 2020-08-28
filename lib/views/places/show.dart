import 'package:flutter/material.dart';
import 'package:meple/helper/google_map.dart';
import 'package:meple/helper/multi_image.dart';
import 'package:meple/models/place.dart';
import 'package:meple/views/places/googlemap.dart';


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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 20,
                decoration: containerDeco,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: _place.name, style: TextStyle(fontSize: 20)),
                        ],
                        style: DefaultTextStyle.of(context).style,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(

              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(30),
                decoration: containerDeco,
                child: _place.images != null ? MultiImageView(images: _place.images)
                : Image.asset(
                  'assets/images/noimage.png',
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onLongPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OnlyGoogleMap();
                  }));
                },
                child: Container(
                  child: CustomGoogleMap(),
                  height: 250,
                  width: 250,
                ),
              ),
              Container(
                child: Text("※長押しで詳しく見る"),
                padding: EdgeInsets.only(bottom: 20),
              ),
            ],
          )
        ),
      ),
    );
  }
  BoxDecoration containerDeco = BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 4, 
    ),
  );
}