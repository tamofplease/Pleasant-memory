import 'find.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindBloc extends Bloc<FindEvent, FindState> {
  @override
  FindState get initialState => FinderRootState();

  Stream<FindState> mapEventToState(
    FindEvent event,
  ) async* {
    if (event is FindRootEvent) {
      yield FinderRootState();
    } else if (event is FindPlaceEvent) {
      yield FinderPlaceState();
    } else if (event is FindUserEvent) {
      yield FinderUserState();
    }
  }
}
