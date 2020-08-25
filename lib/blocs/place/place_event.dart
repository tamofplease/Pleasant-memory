import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meple/models/place.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


abstract class PlaceEvent extends Equatable{
  PlaceEvent([List porps = const[]]);
  List<Object> get props => [props];
}

class GetCreatePlace extends PlaceEvent{ //createの通知。
  final Place place;
  final String uid;
  final List<Asset> images;
  GetCreatePlace({@required this.place, @required this.uid, this.images})
  : assert(
    place != null,
    uid != null,
    );
  @override
  List<Object> get props => [place, uid];

  @override
  String toString() => "CreateEvent";
}

class GetNewPlace extends PlaceEvent { //Newpageの取得
  @override
  List<Object> get props => [];
  @override
  String toString() => "GetNewPlace";
}

class GetIndexPlace extends PlaceEvent { //view側からindexのつうち
  final String uid;
  GetIndexPlace(this.uid);

  @override
  List<Object> get props => [uid];

  @override
  String toString() => "getIndexPlace";
}

class GetIndexPlaces extends PlaceEvent { //firestoreからindex取得の通知
  final List<Place> places;
  GetIndexPlaces(this.places);

  @override
  List<Object> get props => [places];

  @override
  String toString() => "GetIndexPlaces";
}

class GetInitialPlace extends PlaceEvent { //初期状態に戻す
  @override
  List<Object> get props => [];
}

