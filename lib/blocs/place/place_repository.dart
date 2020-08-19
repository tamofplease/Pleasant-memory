import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/place.dart';
import 'package:meple/models/user.dart';

abstract class PlaceDataRepository{
  Stream<Place> getPlaceData(String uid);
  Future<void> createPlace(Place place, String uid);
  Future<void> createPlaceinPlace(Place place, String uid);
  Future<void> createPlaceinUser(Place place, String uid);
}

class PlaceRepository extends PlaceDataRepository{
  final CollectionReference placesCollection = Firestore.instance.collection("places");
  final CollectionReference usersCollection = Firestore.instance.collection("users");
  @override
  Stream<Place> getPlaceData(String uid) {
    // return placesCollection.document(uid)
  }

  @override
  Future<void> createPlaceinPlace(Place place, String uid) async {
    try{
      return await placesCollection.document(uid).setData({
        'name': place.name,
        'detail': place.detail,
        'address': place.postalCode,
        'url': place.url,
        'creatorId': uid,
        'been': false,
      });
    }catch(e){
      print("\n error is occur in place_repo l:31");
    }
  }

  @override
  Future<void> createPlaceinUser(Place place, String uid) async {
    try {
      return await usersCollection.document(uid).collection("places").document(place.name).setData({
        'name': place.name,
        'detail': place.detail,
        'address': place.postalCode,
        'url': place.url,
        'creatorId': uid,
        'been': false,
      });
    }catch(e){
      print("\n error is occur in place_repo l:31");
    }
  }

  @override
  Future<void> createPlace(Place place, String uid) async {
    await createPlaceinUser(place, uid);
    await createPlaceinPlace(place, uid);
  }
}