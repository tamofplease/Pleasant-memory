import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/current_user.dart';

abstract class SettingRepository {
  Future<CurrentUser> updateUser(CurrentUser currentUser);
}

class SettingRepo extends SettingRepository {
  final CollectionReference userCollection = Firestore.instance.collection("users");

  Future<CurrentUser> updateUser(currentUser) async {
    await userCollection.document(currentUser.uid).setData({
      'name': currentUser.name ?? "Noname",
      'email': currentUser.email,
      'updatedAt': DateTime.now(),
    });
    return currentUser;
  }
}

