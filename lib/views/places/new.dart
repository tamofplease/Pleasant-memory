import 'package:flutter/material.dart';
import 'package:meple/views/places/form.dart';


class NewPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
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
              PlaceFrom(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: SafeArea(
          child: NewPlaceForm(),
        ),
        onPressed: () {
          Navigator.pop(context);
        }
      ),
    );

  }
}

class NewPlaceForm extends StatefulWidget {
  @override
  _NewPlaceFormState createState() => _NewPlaceFormState();
}

class _NewPlaceFormState extends State<NewPlaceForm> {

  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

