import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';

class PlaceImagePick extends StatefulWidget {
  @override

  _PlaceImagePickState createState() => _PlaceImagePickState();
}


class _PlaceImagePickState extends State<PlaceImagePick> {
  List<Asset> images = List<Asset>();
  String _error;

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    if (images != null){
      return GridView.count(
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          );
        }),
      );
    }
    else
      return Container(
      );
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100,
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(
              "画像を選択",
              style: TextStyle(
                color: Colors.lightBlueAccent,
              ), 
            ),
            onPressed: loadAssets,
          ),
          Expanded(
            child: buildGridView(),
          ),
        ],
      ),
    );
  }
}