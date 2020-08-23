import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/image/image.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';
import 'package:meple/blocs/image/image.dart';



class PlaceImagePick extends StatelessWidget {

  Widget buildGridView(List<Asset> images) {
    if (images != null){
      return GridView.count(
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 100,
            height: 100,
          );
        }),
      );
    }
    else
      return Container(
      );
  }

  Widget buildListView(List<Asset> images) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index){
        return AssetThumb(
          asset: images[index],
          width: 100,
          height: 100,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if(state is PickedPlaceImages && state.images != null){
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  child: buildListView(state.images),
                  height: 100,
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text(
                    "画像を追加",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                    ), 
                  ),
                  onPressed: () => BlocProvider.of<ImageBloc>(context).add(PickPlaceImages()),
                ),
              ],
            ),
          );
        }
        return Container(
            height:100,
            child: Column(
              children: <Widget>[
                SizedBox(height:20),
                RaisedButton(
                  child: Text(
                    "画像を選ぶ",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                    ), 
                  ),
                  onPressed: () => BlocProvider.of<ImageBloc>(context).add(PickPlaceImages()),
                ),
              ],
            ),
          );
        
      }
    );
  }
}