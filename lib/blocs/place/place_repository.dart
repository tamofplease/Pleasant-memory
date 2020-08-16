import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/place.dart';
import 'package:meple/models/user.dart';

abstract class PlaceDataRepository{
  Stream<Place> getPlaceData(String uid);
  Future<void> createPlace(Place place, String uid);
}


class PlaceRepository extends PlaceDataRepository{
  final CollectionReference placesCollection = Firestore.instance.collection("places");

  @override
  Stream<Place> getPlaceData(String uid) {
    // return placesCollection.document(uid)
  }

  @override
  Future<void> createPlace(Place place, String uid) async {
    try{
      return await placesCollection.document(uid).setData({
        'name': place.name,
        'detail': place.detail,
        'address': place.postalCode.toInt(),
        'url': place.url,
        'creatorId': uid,
        'been': false,
      });
    }catch(e){
      print(e);
    }
  }
}