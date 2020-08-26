import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/image/image.dart';
import 'package:meple/blocs/place/place.dart';
import 'package:meple/models/place.dart';
import 'package:provider/provider.dart';
import 'package:meple/views/places/places.dart';

class PlaceFrom extends StatefulWidget {
  @override
  _PlaceFromState createState() => _PlaceFromState();
}

class _PlaceFromState extends State<PlaceFrom> {
  final _formKey = GlobalKey<FormState>();
  String _name,_postalCode,_url;
  String _detail;
  @override
  Widget build(BuildContext context) {   
    String _uid = Provider.of<String>(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  children: [
                    placeTitle("名前", Icons.account_box, true),
                    TextFormField(
                      maxLength: 30,
                      maxLengthEnforced: true,
                      validator: (val) => val.isEmpty ? "値を入力してください" : null,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorRadius: Radius.circular(100),
                      initialValue: _name,
                      onChanged: (val) => setState(() {
                        _name = val;
                      }),
                      decoration: placeDeco.copyWith(counterStyle: TextStyle(color: Colors.white)),
                    ),
                    
                    SizedBox(height: 20),
                    placeTitle("詳細", Icons.add_box, false),
                    TextFormField(
                      maxLines: null,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorRadius: Radius.circular(100),
                      initialValue: _detail,
                      onChanged: (val) => setState(() {
                        _detail = val;
                      }),
                      decoration: placeDeco,
                    ),
                    SizedBox(height: 20),
                    placeTitle("住所", Icons.ac_unit, false),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorRadius: Radius.circular(100),
                      initialValue: _postalCode,
                      onChanged: (val) => setState(() {
                        _postalCode = val;
                      }),
                      decoration: placeDeco,
                    ),
                    SizedBox(height: 20),
                    placeTitle("URL", Icons.ac_unit, false),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorRadius: Radius.circular(100),
                      initialValue: _url,
                      onChanged: (val) => setState(() {
                        _url = val;
                      }),
                      decoration: placeDeco,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ), 
              PlaceImagePick(),
              BlocBuilder<ImageBloc, ImageState>(
                builder: (context, state) {
                  if(state is PickedPlaceImages){
                    return RaisedButton(
                      child: Text("保存"),
                      splashColor: Colors.yellow,
                      onPressed: (){
                        BlocProvider.of<PlaceBloc>(context).add(
                          GetCreatePlace(
                            place: Place(
                              postalCode: _postalCode,
                              id: 1,
                              name: _name,
                              url: _url,
                              detail: _detail,
                              been: false,
                              creatorId: _uid,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ), 
                            uid: _uid,
                            images: state.images,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      color: Colors.lightGreen,
                    );
                  }
                  return RaisedButton(
                    child: Text("保存"),
                    splashColor: Colors.yellow,
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        BlocProvider.of<PlaceBloc>(context).add(
                          GetCreatePlace(
                            place: Place(
                              postalCode: _postalCode,
                              id: 1,
                              name: _name,
                              url: _url,
                              detail: _detail,
                              been: false,
                              creatorId: _uid,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ), 
                            uid: _uid
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    color: Colors.lightGreen,
                  );
                }
              ),
            ],
          )
        )
      ), 
    );
  }
  Widget placeTitle(String name, IconData icon, bool req) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        req ? Text(
          "必須",
          style: TextStyle(
            fontSize: 10,
            color: Colors.redAccent,
          ),
        ) : Text(""),
        SizedBox(width: 10),
        Text(
          name,
          style: TextStyle(
            fontSize: 17,
            color: req ? Colors.amberAccent : Colors.lightBlueAccent,
          )
        ),
        SizedBox(width: 10),
        Icon(
          icon,
          color: req ? Colors.amberAccent : Colors.lightBlueAccent 
        ),

      ],
      
    );
  }
}

const InputDecoration placeDeco = InputDecoration(
  fillColor: Colors.yellowAccent,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.yellowAccent,
      width: 2,
    ),
  ),
);