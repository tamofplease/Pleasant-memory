import 'package:flutter_bloc/flutter_bloc.dart';
import './find_method.dart';

class FindMethodBloc extends Bloc<FindMethodEvent, FindMethodState> {
  FindMethodState get initialState => FindMethodAsUserId();

  Stream<FindMethodState> mapEventToState(
    FindMethodEvent event,
  ) async* {
    if (event is ChangeFindMethodUserName) {
      yield FindMethodAsUserName();
    } else if (event is ChangeFindMethodUserId) {
      yield FindMethodAsUserId();
    }
  }
}
