import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'form.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  @override
  FormState get initialState => FormInputState("");

  Stream<FormState> mapEventToState(
    FormEvent event,
  ) async* {
    if (event is FormInputEvent) {
      yield FormInputState(event.inputString);
    }
  }
}
