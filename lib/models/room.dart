import 'package:flutter/material.dart';

class Room {
  final String uid;
  final String uidTo;
  final int chatNum;
  final String name;
  final String photoUrl;
  final DateTime createdAt = DateTime.now();
  final DateTime updatedAt;
  Room({
    @required this.uid,
    @required this.uidTo,
    @required this.chatNum,
    @required this.name,
    @required this.photoUrl,
    @required this.updatedAt,
  })  : assert(uid != null),
        assert(uidTo != null),
        assert(updatedAt != null);
}
