import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/current_user.dart';

abstract class UserRepository {
  Stream<CurrentUser> getUserData(String uid);
}

class CurrentUserRepository extends UserRepository {

  final CollectionReference usersCollection = Firestore.instance.collection("users");


  @override
  Stream<CurrentUser> getUserData(String uid) {
    return usersCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  CurrentUser _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return CurrentUser(
      uid: snapshot["uid"],
      name: snapshot["name"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      createdAt: snapshot["createdAt"].toDate(),
      updatedAt: snapshot["updatedAt"].toDate(),
    );
  }
}

