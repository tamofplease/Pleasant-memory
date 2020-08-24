import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class Place {
  final int id;
  final String postalCode;
  final String name,url;
  final String detail;
  bool been; //0がまだ、1が行った
  List<dynamic> images;
  final String creatorId;
  final DateTime createdAt;
  final DateTime updatedAt;
  

  Place({
    this.id,
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