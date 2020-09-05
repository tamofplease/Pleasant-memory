import 'package:flutter/material.dart';

class Follow {
  final String uid;
  final String uidTo;
  Follow({
    @required this.uid,
    @required this.uidTo,
  })  : assert(uid != null),
        assert(uidTo != null);
}
