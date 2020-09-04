import 'package:flutter/material.dart' hide FormState;
import 'package:meple/blocs/find_user/find_user.dart';
import 'package:meple/blocs/form_bloc/form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/views/homes/finder/finder_error_alert_dialog.dart';
import 'package:meple/views/homes/finder/finder_user_id_success_form.dart';

class FindByUserNameForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person),
          Text("User名"),
        ],
      ),
      BlocBuilder<FormBloc, FormState>(builder: (context, state) {
        if (state is FormInputState) {
          return Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Center(
                      child: TextFormField(
                    initialValue: state.inputString,
                    cursorRadius: Radius.circular(100),
                    onChanged: (val) => BlocProvider.of<FormBloc>(context)
                        .add(FormInputEvent(val)),
                  )),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () => BlocProvider.of<FindUserBloc>(context)
                      .add(FindUserByNameEvent(state.inputString)),
                  child: Text("検索"),
                ),
                SizedBox(height: 20),
                BlocBuilder<FindUserBloc, FindUserState>(
                    builder: (context, state) {
                  if (state is FindUserInitialState)
                    return Container();
                  else if (state is FindUserSearchState) {
                    return Container(child: Text(state.searchString));
                  } else if (state is FindUserSuccess) {
                    return FinderUserSuccessFrom(state.user);
                  } else if (state is FindUserFailuer) {
                    return FinderErrorAlertDialog();
                  }
                  return Container(child: Text("nothing"));
                })
              ],
            ),
          );
        }
        return Container();
      })
    ]);
  }
}
