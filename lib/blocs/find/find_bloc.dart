import 'find.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindBloc extends Bloc<FindEvent, FindState> {
  @override
  FindState get initialState => FinderRoot();

  Stream<FindState> mapEventToState(
    FindEvent event,
  ) async* {
    if (event is FindRootEvent) {
      yield FinderRoot();
    } else if (event is FindPlaceEvent) {
      yield FinderPlace();
    } else if (event is FindUserEvent) {
      yield FinderUser();
    }
  }
}
