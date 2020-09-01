import 'package:flutter/material.dart';
import 'package:meple/blocs/category/category.dart';
import 'package:meple/helper/coming_soon.dart';
import 'package:meple/views/homes/finder/finder_choice.dart';
import 'categories.dart';
import 'memory_choice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/models/enums/category.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text = "";
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return BlocBuilder<CategoryBloc, Category>(
      builder: (context, state) {
        if(state == Category.Memory) {
          text= MemoryEvent().toString();
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Categorylist(),
                MemoryChoice(),
              ],
            ),
          );
        }
        if(state == Category.Chat ) {
          text = ChatEvent().toString();
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Categorylist(),
                SizedBox(height: 20.0),
                ComingSoon(0.8),
              ],
            ),
          );
        }
        if(state == Category.Find) {
          text = FindEvent().toString();
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Categorylist(),
                FinderChoice(),
                // SizedBox(height: 20.0),
                // ComingSoon(0.8),
              ],
            ),
          );
        }
        return Container();

      }
    );
  }
}
