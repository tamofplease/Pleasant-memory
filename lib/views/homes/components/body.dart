import 'package:flutter/material.dart';
import 'package:meple/blocs/category/category_bloc.dart';
import 'package:meple/blocs/category/category_state.dart';
import 'package:meple/blocs/category/category_event.dart';
import 'categories.dart';
import 'genres.dart';
import 'movie_carousel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text = "";
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return BlocBuilder<CategoryBloc, CategoryState>(
      bloc: categoryBloc,
      builder: (context, state) {
        if(state is SelectedChat) {
          text= ChatEvent().toString();
        }
        if(state is SelectedMemory) {
          text = MemoryEvent().toString();
        }
        if(state is SelectedFind) {
          text = FindEvent().toString();
        }

        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Categorylist(),
              ArgumentText(text),
              Genres(),
              SizedBox(height: 20.0),
              MovieCarousel(),
            ],
          ),
        );
      }
    );
  }

  Text ArgumentText(String text) {
    return Text(
      text,
    );
  }
}
