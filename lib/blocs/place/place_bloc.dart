import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/place/place.dart';
import 'package:meple/models/place.dart';
import 'package:meple/models/user.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlaceRepository _placeRepository;
  StreamSubscription _placesSubscription;

  PlaceBloc(this._placeRepository);

  @override get initialState => PlaceInitial();

  Stream<PlaceState> mapEventToState(
    PlaceEvent event,
  ) async* {
    if(event is GetCreatePlace){
      yield* _mapCraetePlaceToState(event.place, event.uid);
    }else if(event is GetNewPlace) {
      yield PlaceNew();
    }else if(event is GetIndexPlace){
      yield* _mapIndexPlaceToState(event.uid);
    }else if(event is GetInitialPlace) {
      yield PlaceInitial();
    }else if(event is GetIndexPlaces) {
      yield PlaceIndex(places: event.places);
    }
  }

  Stream<PlaceState> _mapCraetePlaceToState(Place place, String uid)async* {
    try{      
      await _placeRepository.createPlace(place, uid);
      // yield PlaceCreated(place: place);
      yield PlaceCreated(place: place);

    } catch(e) {
      print("\nerror is occur in place_dart_bloc l:24\n");
    }
  }

  Stream<PlaceState> _mapIndexPlaceToState(String uid)async* {
    try{
      _placesSubscription = _placeRepository.getPlaceList(uid).listen(
        (places) {
          add(
            GetIndexPlaces(places),
          );
        }
      );
    } catch(e) {
      print(e);
    }
  }




}