import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/find/find.dart';
import 'package:meple/views/homes/finder/finder_choice.dart';
import 'package:meple/views/homes/finder/finder_user.dart';

class FinderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindBloc, FindState>(builder: (context, state) {
      if (state is FinderRootState) {
        return FinderChoice();
      }
      if (state is FinderPlaceState) {
        return Text("FinderPlace");
      }
      if (state is FinderUserState) {
        return FinderUser();
      }
      return Text("fail");
    });
  }
}
