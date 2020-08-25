import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/image/image.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';
import 'package:meple/blocs/image/image.dart';



class PlaceImagePick extends StatelessWidget {

  Widget buildListView(List<Asset> images) {
    return Center(
      child: new ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index){
          return Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: AssetThumb(
              asset: images[index],
              width: 150,
              height: 150,
            ),
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if(state is PickedPlaceImages){
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  child: buildListView(state.images),
                  height: 150,
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
                SizedBox(height: 20),
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