import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/place/place.dart';
import 'package:meple/models/place.dart';
import 'package:provider/provider.dart';

class PlaceFrom extends StatefulWidget {
  @override
  _PlaceFromState createState() => _PlaceFromState();
}

class _PlaceFromState extends State<PlaceFrom> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _uid = Provider.of<String>(context);
    print(_uid);
    String _name,_postalCode,_url;
    Text _detail;
    String _images;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              placeTitle("名前", Icons.account_box),
              inputForm(_name),
              SizedBox(height: 20),
              placeTitle("詳細", Icons.add_box),
              inputForm(_detail),
              SizedBox(height: 20),
              placeTitle("住所", Icons.ac_unit),
              inputForm(_postalCode),
              SizedBox(height: 20),
              placeTitle("URL", Icons.ac_unit),
              inputForm(_url),
              SizedBox(height: 20),
              RaisedButton(
                child: Text("保存"),
                splashColor: Colors.yellow,
                onPressed: (){
                  BlocProvider.of<PlaceBloc>(context).add(
                    CreatePlace(
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

  Widget inputForm(dynamic target) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      cursorRadius: Radius.circular(100),
      // readOnly: true,
      initialValue: target,
      onChanged: (val) => setState(() {
        target = val.toString();
        print(target);
      }),
        
      decoration: new InputDecoration(
        fillColor: Colors.lightBlueAccent,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent),
        ),
        
      ),
    );
  }
}