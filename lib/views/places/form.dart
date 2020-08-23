import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  String _images;
  @override
  Widget build(BuildContext context) {   
    String _uid = Provider.of<String>(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              placeTitle("名前", Icons.account_box),
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorRadius: Radius.circular(100),
                initialValue: _name,
                onChanged: (val) => setState(() {
                  _name = val;
                }),
                validator: (val) => val.isEmpty? "error" : null,
                decoration: placeDeco,
              ),
              SizedBox(height: 20),
              placeTitle("詳細", Icons.add_box),
              TextFormField(
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
              placeTitle("住所", Icons.ac_unit),
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
              placeTitle("URL", Icons.ac_unit),
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
              PlaceImagePick(),
              SizedBox(height: 20),
              RaisedButton(
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
                      uid: _uid
                    ),
                  );
                  Navigator.pop(context);
                },
                color: Colors.lightGreen,
              ),
            ],
          )
        )
      ), 
    );
  }
  Widget placeTitle(String name, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 17,
            color: Colors.lightBlueAccent,
          )
        ),
        SizedBox(width: 10),
        Icon(
          icon,
          color: Colors.lightBlueAccent,
          ),
      ],
    );
  }
}

const InputDecoration placeDeco = InputDecoration(
  fillColor: Colors.lightBlueAccent,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent),
  ),
);