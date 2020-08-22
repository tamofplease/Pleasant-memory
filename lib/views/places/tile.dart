import 'package:flutter/material.dart';
import 'package:meple/models/place.dart';
import 'package:meple/models/user.dart';

class PlaceTile extends StatelessWidget {

  final Place _place;
  PlaceTile(this._place);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)){
          return PlaceShow();
        });
      },
      child: Container(
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
          color: Colors.white,
        ),
      ),
    );
  }
}