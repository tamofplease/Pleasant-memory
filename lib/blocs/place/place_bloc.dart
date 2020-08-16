import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/place/place.dart';
import 'package:meple/models/place.dart';
import 'package:meple/models/user.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlaceRepository _placeRepository;

  PlaceBloc(this._placeRepository);

  @override get initialState => NewPlace();

  Stream<PlaceState> mapEventToState(
    PlaceEvent event,
  ) async* {
    if(event is CreatePlace){
      yield* _mapCraetePlaceToState(event.place, event.user);
    }
  }

  Stream<PlaceState> _mapCraetePlaceToState(Place place, User user)async* {
    try{
      await _placeRepository.createPlace(place, user.uid);
      yield PlaceProgress();
    } catch(e) {
      print("\nerror is occur in place_dart_bloc l:24\n");
    }
  }
}