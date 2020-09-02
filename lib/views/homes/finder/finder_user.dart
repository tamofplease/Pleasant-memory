import 'package:flutter/material.dart' hide FormState;
import 'package:meple/blocs/find_user/find_user.dart';
import 'package:meple/blocs/form_bloc/form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/find_method_bloc/find_method.dart';
import './finder_user_id_form.dart';
import './finder_by_user_name_form.dart';

class FinderUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text("検索条件"),
        ),
        BlocBuilder<FindMethodBloc, FindMethodState>(builder: (context, state) {
          if (state is FindMethodAsUserId) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Idから探す"),
                    Radio(
                        value: 1,
                        groupValue: 1,
                        onChanged: (val) =>
                            BlocProvider.of<FindMethodBloc>(context)
                                .add(ChangeFindMethodUserId())),
                    SizedBox(width: 20),
                    Text("名前から探す"),
                    Radio(
                        value: 2,
                        groupValue: 1,
                        onChanged: (val) =>
                            BlocProvider.of<FindMethodBloc>(context)
                                .add(ChangeFindMethodUserName())),
                  ],
                ),
                SizedBox(height: 40),
                FindByUserIdForm(),
              ],
            );
          } else if (state is FindMethodAsUserName) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Idから探す"),
                    Radio(
                        value: 1,
                        groupValue: 2,
                        onChanged: (val) =>
                            BlocProvider.of<FindMethodBloc>(context)
                                .add(ChangeFindMethodUserId())),
                    SizedBox(width: 20),
                    Text("名前から探す"),
                    Radio(
                        value: 2,
                        groupValue: 2,
                        onChanged: (val) =>
                            BlocProvider.of<FindMethodBloc>(context)
                                .add(ChangeFindMethodUserName())),
                  ],
                ),
                SizedBox(height: 40),
                FindByUserNameForm(),
              ],
            );
          }
          return Container();
        }),
      ],
    );
  }
}
