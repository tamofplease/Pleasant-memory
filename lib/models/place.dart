import 'package:flutter/material.dart';

class Place {
  final int id;
  final String postalCode;
  final String name,url;
  final Text detail;
  bool been; //0がまだ、1が行った
  List<String> images;
  final String creatorId;
  final DateTime createdAt;
  final DateTime updatedAt;
  

  Place({
    @required this.id,
    @required this.name,
    @required this.url,
    @required this.creatorId,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.postalCode,
    this.been,
    this.detail,
    this.images,
    
  });
}