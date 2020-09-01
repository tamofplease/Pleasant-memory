import 'package:flutter/material.dart' hide FormState;
import 'package:meple/blocs/form_bloc/form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinderUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, FormState>(builder: (context, state) {
      if (state is FormInputState) {
        return Center(
            child: TextFormField(
          initialValue: state.inputString,
          cursorRadius: Radius.circular(100),
          onChanged: (val) =>
              BlocProvider.of<FormBloc>(context).add(FormInputEvent(val)),
        ));
      }
      return Container();
    });
  }
}
