import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/current_user.dart';

abstract class UserRepository {
  Stream<CurrentUser> getUserData(String uid);
  Future<void> updateUser(CurrentUser currentUser);
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

  Future<void>  updateUser(currentUser) async {
    try {
      return await usersCollection.document(currentUser.uid).setData({
        'uid': currentUser.uid,
        'name': currentUser.name,
        'email': currentUser.email,
        'photoUrl': currentUser.photoUrl,
        'updatedAt': DateTime.now(),
        'createdAt': currentUser.createdAt,
      });
    }catch(e) {
    }
  }
}

