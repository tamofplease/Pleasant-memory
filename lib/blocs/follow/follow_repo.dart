import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FollowUserDataRepository {
  Stream<bool> getUserFollowingDataFromUid(String uid, String uidTo);
  Future<void> createNeedData(
      String uid, String uidTo, String name, String photoUrl);
  Future<void> deleteUserFollowing(String uid, String uidTo);
}

class FollowUserRepository extends FollowUserDataRepository {
  final CollectionReference followsCollection =
      Firestore.instance.collection("follows");
  final CollectionReference chatsCollection =
      Firestore.instance.collection("rooms");

  Stream<bool> getUserFollowingDataFromUid(
    String uid,
    String uidTo,
  ) {
    try {
      return followsCollection
          .where("uid", isEqualTo: uid)
          .where("uidTo", isEqualTo: uidTo)
          .snapshots()
          .map((data) {
        if (data.documents.isNotEmpty)
          return true;
        else
          return false;
      });
    } catch (e) {
      throw ("error from follwing");
    }
  }

  @override
  Future<void> createNeedData(
      String uid, String uidTo, String name, String photoUrl) async {
    await _createUserRoomPlace(uid, uidTo, name, photoUrl);
    await _createUserFollowing(uid, uidTo);
  }

  Future<void> _createUserFollowing(String uid, String uidTo) async {
    try {
      return await followsCollection.document("$uid+$uidTo").setData({
        'uid': uid,
        'uidTo': uidTo,
      });
    } catch (e) {}
  }

  Future<void> _createUserRoomPlace(
      String uid, String uidTo, String name, String photoUrl) async {
    try {
      return await chatsCollection
          .document(uid)
          .collection("uidTo")
          .document(uidTo)
          .setData({
        'uid': uid,
        'uidTo': uidTo,
        'chatNum': 0,
        'name': name,
        'photoUrl': photoUrl,
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUserFollowing(String uid, String uidTo) async {
    try {
      return await followsCollection.document("$uid+$uidTo").delete();
    } catch (e) {}
  }
}
