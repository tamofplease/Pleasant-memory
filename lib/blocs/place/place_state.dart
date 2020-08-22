import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:meple/models/place.dart';

abstract class PlaceState extends Equatable{
  PlaceState([List props = const[]]);
  List<Object> get props => [props];
}

class PlaceInitial extends PlaceState { //初期状態
  @override
  List<Object> get props => [];
  @override
  String toString() => "PlaceInitial";
}

class PlaceNew extends PlaceState { //新規作成画面
  @override
  List<Object> get props => [];
  @override
  String toString() => "NewPlace";
}

class PlaceCreated extends PlaceState { //作成後(snackbar)
  final Place place;
  PlaceCreated({ @required this.place})
  : assert(place != null);

  @override
  List<Object> get props => [place];

  @override
  String toString() => "PlaceCreated";
}

class PlaceIndex extends PlaceState { //一覧画面
  final List<Place> places;
  PlaceIndex({ @required this.places});

  @override
  List<Object> get props => [places];
}





