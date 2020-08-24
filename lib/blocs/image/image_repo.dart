import 'package:flutter/services.dart';
import 'package:meple/models/place.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meple/extensions.dart';


abstract class ImageDataReposiroy {
  List<dynamic> saveImages(List<Asset> assets, Place place, String uid);
}

class ImageRepository extends ImageDataReposiroy{

  Future<dynamic> _saveImage(int index, Asset asset, String name, String uid) async {
    ByteData byteData = await asset.getByteData();
    List<int> imageData = byteData.buffer.asUint8List();
    StorageReference ref = FirebaseStorage.instance.ref().child('$uid/$name/$index.jpg');
    StorageUploadTask uploadTask = ref.putData(imageData);
    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  List<dynamic> saveImages(List<Asset> assets, Place place, String uid) {

    return assets.indexedMap((index, asset) {
      _saveImage(index, asset, place.name, uid);
    }).toList();
  }
}

