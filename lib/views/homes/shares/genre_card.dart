import 'package:flutter/material.dart';



class GenreCard extends StatelessWidget {
  final String genre;

  const GenreCard({Key key, this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20.0),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0 / 4, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: TextStyle(color: Color(0xFF12153D).withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}
