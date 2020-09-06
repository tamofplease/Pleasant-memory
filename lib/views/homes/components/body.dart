import 'package:flutter/material.dart';
import 'package:meple/blocs/category/category.dart';
import 'package:meple/helper/coming_soon.dart';
import 'package:meple/views/chat/over/chat_over.dart';
import 'package:meple/views/homes/finder/finder_route.dart';
import 'categories.dart';
import 'memory_choice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/models/enums/category.dart';
import 'package:meple/blocs/find/find.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return BlocBuilder<CategoryBloc, Category>(builder: (context, state) {
      if (state == Category.Memory) {
        BlocProvider.of<FindBloc>(context).add(FindRootEvent());
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Categorylist(),
              MemoryChoice(),
            ],
          ),
        );
      }
      if (state == Category.Chat) {
        BlocProvider.of<FindBloc>(context).add(FindRootEvent());
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Categorylist(),
              SizedBox(height: 20.0),
              ChatOver(),
            ],
          ),
        );
      }
      if (state == Category.Find) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Categorylist(),
              FinderRoute(),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
