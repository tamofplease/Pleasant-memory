import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meple/models/place.dart';
import 'package:meple/models/user.dart';


abstract class PlaceEvent extends Equatable{
  PlaceEvent([List porps = const[]]);
  List<Object> get props => [props];
}

class CreatePlace extends PlaceEvent{
  final Place place;
  final String uid;
  CreatePlace({@required this.place, @required this.uid})
  : assert(
    place != null,
    uid != null,
    );
  @override
  List<Object> get props => [place, uid];

  @override
  String toString() => "CreateEvent";
}

