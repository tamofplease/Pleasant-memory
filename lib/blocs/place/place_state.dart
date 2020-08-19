import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:meple/models/place.dart';

abstract class PlaceState extends Equatable{
  PlaceState([List props = const[]]);
  List<Object> get props => [props];
}

class PlaceNew extends PlaceState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "NewPlace";
}

class PlaceCreated extends PlaceState {
  final Place place;
  PlaceCreated({ @required this.place})
  : assert(place != null);

  @override
  List<Object> get props => [place];

  @override
  String toString() => "PlaceCreated";
}



