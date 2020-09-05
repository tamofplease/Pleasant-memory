import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FollowUserDataRepository {
  Stream<bool> getUserFollowingDataFromUid(String uid, String uidTo);
}

class FollowUserRepository extends FollowUserDataRepository {
  final CollectionReference followsCollection =
      Firestore.instance.collection("follows");

  Stream<bool> getUserFollowingDataFromUid(String uid, String uidTo) {
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

  Future<void> createUserFollowing(String uid, String uidTo) async {
    try {
      return await followsCollection.document("$uid+$uidTo").setData({
        'uid': uid,
        'uidTo': uidTo,
      });
    } catch (e) {}
  }

  Future<void> deleteUserFollowing(String uid, String uidTo) async {
    try {
      return await followsCollection.document("$uid+$uidTo").delete();
    } catch (e) {}
  }
}
