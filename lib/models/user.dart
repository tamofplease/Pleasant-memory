import 'package:flutter/material.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  User({
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoUrl,
    @required this.createdAt,
    @required this.updatedAt,
  }) :assert(uid != null),
      assert(name != null),
      assert(email != null),
      assert(photoUrl != null),
      assert(createdAt != null),
      assert(updatedAt != null);

  dynamic profileWithBackgroundImage() {
    if(this.photoUrl=="assets/images/default.png"){
      return AssetImage(this.photoUrl);
    }else{
      return NetworkImage(this.photoUrl);
    }
  }
  dynamic profileImage(){
    if(this.photoUrl=="assets/images/default.png"){
      return Image.asset(this.photoUrl);
    }else{
      return Image.network(this.photoUrl);
    }
  }
}