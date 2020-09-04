import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/find_user/find_user.dart';
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
      return usersCollection
          .where("uid", isEqualTo: uid)
          .snapshots()
          .map((data) => _userDataFromSnapshot(data))
          .handleError((error) {
        throw ("erorr from getUser");
      });
    } catch (e) {}
  }

  User _userDataFromSnapshot(QuerySnapshot snapshot) {
    if (snapshot.documents.isNotEmpty) {
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
    } else {
      throw Exception("no finder error");
    }
  }
}
