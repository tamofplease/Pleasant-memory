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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("URL"),
                  SizedBox(width: 10),
                  Icon(Icons.ac_unit),
                ],
              ),
              TextFormField(
                cursorRadius: Radius.circular(100),
                // readOnly: true,
                initialValue: _url,
                onChanged: (val) => setState(() => _url = val),
              ),
            ],
          )
        )
      ), 
    );
  }
}