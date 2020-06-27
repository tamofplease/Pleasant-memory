import 'package:flutter/material.dart';
import 'package:meple/blocs/category/category_bloc.dart';
import 'package:meple/blocs/category/category_state.dart';
import 'package:meple/blocs/category/category_event.dart';
import 'package:meple/helper/coming_soon.dart';
import 'categories.dart';
import 'memory_choice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text = "";
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return BlocBuilder<CategoryBloc, CategoryState>(
      bloc: categoryBloc,
      builder: (context, state) {
        if(state is SelectedMemory) {
          text= MemoryEvent().toString();
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Categorylist(),
                // ArgumentText(text),
                // SizedBox(height: 20.0),
                MemoryChoice(),
              ],
            ),
          );
        }
        if(state is SelectedChat) {
          text = ChatEvent().toString();
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Categorylist(),
                ArgumentText(text),
                SizedBox(height: 20.0),
                ComingSoon(0.8),
              ],
            ),
          );
        }
        if(state is SelectedFind) {
          text = FindEvent().toString();
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Categorylist(),
                ArgumentText(text),
                SizedBox(height: 20.0),
                ComingSoon(0.8),
              ],
            ),
          );
        }

      }
    );
  }

  Text ArgumentText(String text) {
    return Text(
      text,
    );
  }
}
