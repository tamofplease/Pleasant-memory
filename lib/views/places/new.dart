import 'package:flutter/material.dart';
import 'package:meple/views/places/form.dart';
import 'package:provider/provider.dart';


class NewPlace extends StatelessWidget {
  const NewPlace({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "新規作成"
          ),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Container(
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
                PlaceFrom(),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
