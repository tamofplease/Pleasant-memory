import 'package:flutter/material.dart';

class PlaceFrom extends StatefulWidget {
  @override
  _PlaceFromState createState() => _PlaceFromState();
}

class _PlaceFromState extends State<PlaceFrom> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _postalCode, _name, _url;
    Text _detail;
    String images;

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
                  print("press");
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
      onChanged: (val) => setState(() => target = val),
      decoration: new InputDecoration(
        fillColor: Colors.lightBlueAccent,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent),
        ),
        
      ),
    );
  }
}