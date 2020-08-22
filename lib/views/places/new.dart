import 'package:flutter/material.dart';
import 'package:meple/blocs/place/place.dart';
import 'package:meple/helper/helpers.dart';
import 'package:meple/views/places/places.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class NewPlace extends StatelessWidget {
  // const NewPlace({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PlaceBloc>(context).add(GetNewPlace());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
            "新規作成"
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<PlaceBloc, PlaceState>(
          builder: (context, state) {
            if(state is PlaceNew) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.grey[600], BlendMode.modulate),
                    image: AssetImage("assets/home/choice/find_mem.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                          ),
                          child: Text(
                            "ここでは様々なサイトで見つけた\n行きたい場所や行って見たい場所を\n記憶させることができます。",
                          ),
                        ),
                      ),
                      SizedBox(height:30),
                      PlaceImagePick(),
                      PlaceFrom(),
                    ],
                  ),
                ),
              );
            }
            return SplashScreen();
          }
        )
      ),
    );
  }
}
