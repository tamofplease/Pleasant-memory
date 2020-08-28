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
      alignment: Alignment.topCenter,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: _selected ? Colors.white : Colors.white38,
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.star,
                    color: _place.been? Colors.yellow : _selected ? Colors.black : Colors.black45,
                  ),
                ),
                Expanded(
                  child: Text(
                    _place.name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _selected ? 17 : 10,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
      decoration: BoxDecoration(
        color: _selected ? Colors.white12 : Colors.white12,
        image: DecorationImage(
          colorFilter: _selected ? ColorFilter.mode(Colors.white12, BlendMode.dst) : ColorFilter.mode(Colors.grey[600], BlendMode.modulate),
          fit: BoxFit.cover,
          image: _place.images == null ? AssetImage(
            'assets/images/noimage.png',
          ) :
          NetworkImage(
            _place.images[0],
            //loadgin_builderを追加する。
          ),
        ),
        border: Border.all(
          color: _selected ? Colors.yellowAccent : Colors.white10,
          width: 10,
        ),
      ),
    );
  }
}

