import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/current_user.dart';

abstract class SettingRepository {
  Future<void> updateUser(CurrentUser currentUser);
}

class SettingRepo extends SettingRepository {
  final CollectionReference userCollection = Firestore.instance.collection("users");

  Future<void> updateUser(currentUser) async {
    try {
      return await userCollection.document(currentUser.uid).setData({
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

