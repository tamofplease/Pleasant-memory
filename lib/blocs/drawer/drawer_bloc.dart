import 'package:bloc/bloc.dart';
import 'package:meple/blocs/drawer/drawer.dart';

class DrawerBloc extends Bloc<DrawerEvent,DrawerState> {

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
    }
  }

}