import 'package:flutter/material.dart';

class CurrentUser {
  final String uid;
  final String email; 
  final DateTime createdAt;
  final DateTime updatedAt;

  CurrentUser({
    @required this.uid,
    @required this.email, 
    @required this.createdAt,
    @required this.updatedAt,
  }) :assert(uid != null), 
      assert(email != null), 
      assert(createdAt != null),
      assert(updatedAt != null);
}