import 'package:equatable/equatable.dart';

class FormState extends Equatable {
  FormState([List props = const []]);
  List<Object> get props => [props];
}

class FormInputState extends FormState {
  final String inputString;
  FormInputState(this.inputString);

  @override
  List<Object> get props => [inputString];
  @override
  String toString() => "FormInputState";
}
