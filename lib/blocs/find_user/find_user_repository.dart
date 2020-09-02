import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/user.dart';

abstract class FindUserDataRepository {
  Stream<User> getUserDataFromUid(String uid);
}

class FindUserRepository extends FindUserDataRepository {
  final CollectionReference usersCollection =
      Firestore.instance.collection("users");

  @override
  Stream<User> getUserDataFromUid(String uid) {
    try {
      usersCollection.where("uid", isEqualTo: uid).snapshots().listen((data) {
        if (data.documents.isNotEmpty) {
          return _userDataFromSnapshot(data);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  User _userDataFromSnapshot(QuerySnapshot snapshot) {
    return User(
      uid: snapshot.documents[0]["uid"],
      name: snapshot.documents[0]["name"],
      email: snapshot.documents[0]["email"],
      photoUrl: snapshot.documents[0]["photoUrl"],
      createdAt: snapshot.documents[0]["createdAt"] != null
          ? snapshot.documents[0]["createdAt"].toDate()
          : DateTime.now(),
      updatedAt: snapshot.documents[0]["updatedAt"] != null
          ? snapshot.documents[0]["updatedAt"].toDate()
          : DateTime.now(),
    );
  }
}
