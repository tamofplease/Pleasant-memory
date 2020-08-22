import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meple/blocs/place/place.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/helper/helpers.dart';
import 'package:meple/models/place.dart';
import 'package:provider/provider.dart';
import './places.dart';


class IndexPlace extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<String>(context);
    BlocProvider.of<PlaceBloc>(context).add(GetIndexPlace(uid));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("一覧"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<PlaceBloc, PlaceState>(
          builder: (context,state) {
            if(state is PlaceIndex) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.grey[600], BlendMode.modulate),
                    image: AssetImage("assets/home/choice/garary.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: PlaceList(state.places,state.places[0]),
              );
            }
            return SplashScreen();
          }
        )
      )
    );
  }
}