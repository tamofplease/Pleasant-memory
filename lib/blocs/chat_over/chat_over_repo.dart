import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meple/models/room.dart';

abstract class ChatOverDataRepository {
  Stream<List<Room>> getChatRoomList(String uid);
}

class ChatOverRepository extends ChatOverDataRepository {
  final CollectionReference roomsCollection =
      Firestore.instance.collection("rooms");
  final CollectionReference followCollection =
      Firestore.instance.collection("follows");

  @override
  Stream<List<Room>> getChatRoomList(String uid) {
    return roomsCollection
        .document(uid)
        .collection("uidTo")
        .snapshots()
        .map(_roomListFromSnapshot);
  }

  List<Room> _roomListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _roomDataFromSnapshot(doc);
    }).toList();
  }

  Room _roomDataFromSnapshot(DocumentSnapshot snapshot) {
    return Room(
      uid: snapshot['uid'],
      uidTo: snapshot['uidTo'],
      chatNum: snapshot['chatNum'],
      name: snapshot['name'],
      photoUrl: snapshot['photoUrl'],
      updatedAt: snapshot['updatedAt'].toDate() ?? DateTime.now(),
    );
  }
}
