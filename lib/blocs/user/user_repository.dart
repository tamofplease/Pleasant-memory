import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/current_user.dart';
import 'package:meple/models/user.dart';

abstract class UserDataRepository {
  Stream<User> getUserData(String uid);
  Future<void> updateUser(User user);
}

class UserRepository extends UserDataRepository {

  final CollectionReference usersCollection = Firestore.instance.collection("users");


  @override
  Stream<User> getUserData(String uid) {
    return usersCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      uid: snapshot["uid"],
      name: snapshot["name"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      createdAt: snapshot["createdAt"] != null ? snapshot["createdAt"].toDate() : DateTime.now(),
      updatedAt: snapshot["updatedAt"] != null ? snapshot["updatedAt"].toDate() : DateTime.now(),
    );
  }

  Future<void> updateUser(user) async {
    try {
      return await usersCollection.document(user.uid).setData({
        'uid': user.uid,
        'name': user.name,
        'email': user.email,
        'photoUrl': user.photoUrl,
        'updatedAt': DateTime.now(),
        'createdAt': user.createdAt,
      });
    }catch(e) {
      
    }
  }
}

