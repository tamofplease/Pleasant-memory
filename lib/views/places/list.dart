import 'package:flutter/material.dart';
import 'package:meple/models/place.dart';
import './places.dart';

class PlaceList extends StatefulWidget {
  final List<Place> places;

  Place selectedPlace;
  PlaceList(this.places, this.selectedPlace);
  

  @override
  PlaceListState createState() => PlaceListState();
}

class PlaceListState extends State<PlaceList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: ListWheelScrollView(
          onSelectedItemChanged: (index) {
            setState(() {
              widget.selectedPlace = widget.places[index];
            });
          },
          children: <Widget>[
            ...widget.places.map((place) {
              return widget.selectedPlace == place ? 
              PlaceTile(place, true) : PlaceTile(place, false);
            }),
          ],
          itemExtent: 350,
          diameterRatio: 5.0,
        ),
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
          return ShowPlace(widget.selectedPlace);
      })),
    );
  }
}