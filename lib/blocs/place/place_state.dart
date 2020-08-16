import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:equatable/equatable.dart';

abstract class PlaceState extends Equatable{
  PlaceState([List props = const[]]);
  List<Object> get props => [props];
}

class NewPlace extends PlaceState {
  @override
  String toString() {
    return "NewPlace";
  }
}

class PlaceProgress extends PlaceState{
  @override
  String toStinrg() {
    return "PlaceProgress";
  }
}



