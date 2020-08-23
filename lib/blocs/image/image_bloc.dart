import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import './image.dart';

import 'dart:io';


class ImageBloc extends Bloc<ImageEvent,ImageState> {

  @override
  ImageState get initialState => PickImageInitial();

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if(event is ImagePickEvent) {
      yield* _mapImagePickToState();
    }else if(event is PickPlaceImages){
      yield* _mapPickPlaceImagesToState();
    }else if(event is ImageInitial) {
      yield PickImageInitial();
    }
  }

  Stream<ImageState> _mapImagePickToState() async* {
    final _picker = ImagePicker();
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      if(pickedFile != null)yield PickImageSuccess(File(pickedFile.path));
    }catch(_) {
      yield PickImageFailure();
    }
  }

  Stream<ImageState> _mapPickPlaceImagesToState() async* {
    List<Asset> resultList;
    String error;
    try{
      resultList = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: true,
      );
    } on Exception catch(e) {
      error = e.toString();
      yield PickPlaceImagesFail(error);
    }

    yield PickedPlaceImages(resultList);
    

  }
}
