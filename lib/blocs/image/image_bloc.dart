import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
}
