import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meple/blocs/drawer/drawer.dart';
import 'package:meple/blocs/image/image.dart';
import 'package:meple/blocs/user/user.dart';

class DrawerBloc extends Bloc<DrawerEvent,DrawerState> {

  final ImageRepository imageRepo;
  final UserRepository userRepo;
  DrawerBloc(this.imageRepo, this.userRepo);

  @override
  DrawerState get initialState => NothingDrawerState();

  Stream<DrawerState> mapEventToState (
    DrawerEvent event,
  ) async* {
    if(event is HomeDrawerEvent) {
      yield HomeDrawerState();
    }else if(event is ProfileDrawerEvent) {
      yield ProfileDrawerState();
    }else if(event is SettingDrawerEvent) {
      yield SettingDrawerState();
    }else if(event is ContactDrawerEvent) {
      yield ContactDrawerState();
    }else if(event is HelpDrawerEvent) {
      yield HelpDrawerState();
    }else if(event is ChangeImageEvent) {
      yield* _getImageFromGallery(event.uid);
    }else if(event is PushImageEvent) {
      yield* _pushImageToEvent(event.uid, event.pickedFile);
    }else if(event is UpdatedImageProg) {
      yield UpdatedImageProgress();
    }else if(event is Initialize) {
      yield NothingDrawerState();
    }
    // else if(event is UpdateUserImage) {

    // }
  }
    Stream<DrawerState> _getImageFromGallery(String uid) async* {
      yield UpdatedImageProgress();
      PickedFile pickedFile = await imageRepo.getImageFromGallery();
      add(PushImageEvent(pickedFile, uid));
    }

    Stream<DrawerState> _pushImageToEvent(String uid, PickedFile pickedFile) async* {
      try{
        dynamic imageUrl = await imageRepo.uploadImage(pickedFile,uid);
        await userRepo.updateUserProfileImage(uid,imageUrl.toString());
        yield UpdatedImageState(imageUrl);
      }catch(e){
        yield ChangeDrawerImageStateFail();
      }
    }

}