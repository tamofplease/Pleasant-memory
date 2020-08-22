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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.star,
            color: _place.been? Colors.yellow : Colors.grey,
          ),
          Container(
            width: 100,
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
      decoration: BoxDecoration(
        color: _selected ? Colors.white : Colors.grey,
      ),
    );
  }
}