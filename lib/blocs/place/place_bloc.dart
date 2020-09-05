import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/place/place.dart';
import 'package:meple/models/place.dart';
import 'package:meple/blocs/image/image_repo.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlaceRepository _placeRepository;
  final ImageRepository _imageRepository;
  StreamSubscription _placesSubscription;

  PlaceBloc(this._placeRepository, this._imageRepository);

  @override
  get initialState => PlaceInitial();

  Stream<PlaceState> mapEventToState(
    PlaceEvent event,
  ) async* {
    if (event is GetCreatePlace) {
      yield* _mapCraetePlaceToState(event.place, event.uid, event.images);
    } else if (event is GetNewPlace) {
      yield PlaceNew();
    } else if (event is GetIndexPlace) {
      yield* _mapIndexPlaceToState(event.uid);
    } else if (event is GetInitialPlace) {
      yield PlaceInitial();
    } else if (event is GetIndexPlaces) {
      yield PlaceIndex(places: event.places);
    }
  }

  Future<void> _getImageUrls(
      Place place, String uid, List<Asset> images) async {
    await _imageRepository
        .saveImages(images, place, place.creatorId)
        .then((urls) {
      _placeRepository.createPlace(place, uid, urls);
    });
  }

  Future<void> _createPlaceWithoutImages(Place place, String uid) async {
    await _placeRepository.createPlace(place, uid, null);
  }

  Stream<PlaceState> _mapCraetePlaceToState(
      Place place, String uid, List<Asset> images) async* {
    try {
      if (images != null)
        await _getImageUrls(place, uid, images);
      else
        _createPlaceWithoutImages(place, uid);

      yield PlaceCreated(
          place: new Place(
        name: place.name,
        detail: place.detail,
        postalCode: place.postalCode,
        url: place.url,
        creatorId: uid,
        been: false,
        createdAt: place.createdAt,
        updatedAt: place.updatedAt,
      ));
    } catch (e) {
      print(e);
    }
  }

  Stream<PlaceState> _mapIndexPlaceToState(String uid) async* {
    try {
      _placesSubscription = _placeRepository.getPlaceList(uid).listen((places) {
        add(
          GetIndexPlaces(places),
        );
      });
    } catch (e) {
      print(e);
    }
  }
}
