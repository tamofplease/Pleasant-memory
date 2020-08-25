import 'package:flutter/material.dart';
import 'package:meple/models/place.dart';
import './places.dart';


class PlaceTile extends StatelessWidget {

  final Place _place;
  final bool _selected;
  PlaceTile(this._place, this._selected);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.star,
                  color: _place.been? Colors.yellow : Colors.black,
                ),
                Text(
                  _place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black54,
            child: _place.images == null ? 
            Image.asset(
              'assets/images/noimage.png',
              fit: BoxFit.scaleDown,
              colorBlendMode: BlendMode.dst,
            ) : 
            Image.network(
              _place.images[0],
              fit: BoxFit.contain,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          
        ],
      ),
      decoration: BoxDecoration(  
        color: _selected ? Colors.white : Colors.white54,
      ),
    );
  }
}