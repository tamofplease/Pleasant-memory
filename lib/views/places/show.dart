import 'package:flutter/material.dart';
import 'package:meple/helper/google_map.dart';
import 'package:meple/helper/multi_image.dart';
import 'package:meple/models/place.dart';
import 'package:meple/views/places/googlemap.dart';
import 'package:link/link.dart';

class ShowPlace extends StatelessWidget {
  final Place _place;
  ShowPlace(this._place);
  @override
  Widget build(BuildContext context) {
    void _showErrorSnackBar() {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('URLを開けませんでした'),
        ),
      );
    }

    double contentWidth = 300;
    // double contentWidth = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      appBar: AppBar(
        title: Text("詳細"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.grey[600], BlendMode.modulate),
            image: AssetImage("assets/home/choice/garary.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                width: contentWidth,
                decoration: containerDeco,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _place.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: _place.been ? Colors.yellow : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: contentWidth,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: containerDeco,
                child: _place.images != null
                    ? MultiImageView(images: _place.images)
                    : Image.asset(
                        'assets/images/noimage.png',
                        height: 300,
                        width: 300,
                      ),
              ),
              SizedBox(height: 20),
              Container(
                width: contentWidth,
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                decoration: containerDeco,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.subject),
                        Text("詳細"),
                      ],
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: contentWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _place.detail != null
                              ? Text(_place.detail)
                              : Text(""),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: contentWidth,
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                decoration: containerDeco,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.public),
                        Text("Webサイト"),
                      ],
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 10),
                        width: contentWidth,
                        child: _place.url != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Link(
                                  child: Text(
                                    _place.url,
                                    style: TextStyle(color: Colors.lightBlue),
                                  ),
                                  url: _place.url,
                                  onError: _showErrorSnackBar,
                                ),
                              )
                            : Text("リンクが存在しません。")),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: contentWidth,
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                decoration: containerDeco,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                        ),
                        Container(
                          child: Text("場所"),
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      child: Text(
                        "〒${_place.postalCode}",
                      ),
                    ),
                    GestureDetector(
                      onLongPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
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
                      alignment: Alignment.center,
                      child: Text("※長押しで詳しく見る"),
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                  width: contentWidth,
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  decoration: containerDeco,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                          ),
                          Container(
                            child: Text("作成者"),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        alignment: Alignment.center,
                        child: Text(
                          "〒",
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration containerDeco = BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 4,
    ),
    color: Colors.white70,
  );
}
