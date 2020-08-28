import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/place.dart';
import 'package:meple/models/user.dart';

abstract class PlaceDataRepository{
  Stream<List<Place> > getPlaceList(String uid);
  Future<void> createPlace(Place place, String uid, List<dynamic> urls);
  Future<void> createPlaceinPlace(Place place, String uid, List<dynamic> urls);
  Future<void> createPlaceinUser(Place place, String uid, List<dynamic> urls);  
}

class PlaceRepository extends PlaceDataRepository{
  final CollectionReference placesCollection = Firestore.instance.collection("places");
  final CollectionReference usersCollection = Firestore.instance.collection("users");
  
  @override
  Stream<List<Place> > getPlaceList(String uid) {
    return usersCollection.document(uid).collection("places").snapshots().map(_placeListFromSnapshot);
  }

  List<Place> _placeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _placeDataFromSnapshot(doc);
    }).toList();
  }

  Place _placeDataFromSnapshot(DocumentSnapshot doc) {
    return  Place(
      id: 1,
      name: doc["name"],
      creatorId: doc["creatorId"],
      createdAt: doc["createdAt"],
      updatedAt: doc["updatedAt"],
      postalCode: doc["address"]?? "",
      url: doc["url"]?? "",
      been: doc["been"]?? false,
      images: doc["images"],
    );
  }

  @override
  Future<void> createPlaceinPlace(Place place, String uid, List<dynamic> urls) async {
    try{
      return await placesCollection.document(uid).setData({
        'name': place.name,
        'detail': place.detail,
        'address': place.postalCode,
        'url': place.url,
        'creatorId': uid,
        'been': false,
        'images': urls,
      });
    }catch(e){
      print(e);
      print("\n error is occur in place_repo l:53");
    }
  }

  @override
  Future<void> createPlaceinUser(Place place, String uid, List<dynamic> urls) async {
    try {
      return await usersCollection.document(uid).collection("places").document(place.name).setData({
        'name': place.name,
        'detail': place.detail,
        'address': place.postalCode,
        'url': place.url,
        'creatorId': uid,
        'been': false,
        'images': urls,
      });
    }catch(e){
      print("\n error is occur in place_repo l:31");
    }
  }

  @override
  Future<void> createPlace(Place place, String uid, List<dynamic> urls) async {
    await createPlaceinUser(place, uid, urls);
    await createPlaceinPlace(place, uid, urls);
  }
}