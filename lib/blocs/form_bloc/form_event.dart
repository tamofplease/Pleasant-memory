import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEvent extends Equatable {
  FormEvent([List props = const []]);
  List<Object> get props => [props];
}

class FormInputEvent extends FormEvent {
  final String inputString;
  FormInputEvent(this.inputString);
  List<Object> get props => [inputString];
  @override
  String toString() => "FormInputEvent";
}
