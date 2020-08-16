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
  final User user;
  CreatePlace(this.place, this.user)
  : assert(
    place != null,
    user != null,
    );

  @override
  List<Object> get props => [place, user];

  @override
  String toString() => "CreateEvent";
}

