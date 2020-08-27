import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(milliseconds: 250), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
    ..addStatusListener((status) {
      if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> images = ['images/image0.jpg', 'images/image1.jpg', 'images/image2.jpg'];
  String _path = 'images/image0.jpg';

  void _changestate(String path){
    setState(() {
      _path = path;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: animation,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    _path,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              builder: (BuildContext context, Widget child) {
                return Opacity(
                  opacity: animation.value,
                  child: child,
                );
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                smallImage(images[0]),
                smallImage(images[1]),
                smallImage(images[2]),
              ],
            ),
          ],
        ),

      ),
    );
  }
  
  Widget smallImage(String path) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _path == path ? Colors.redAccent : Colors.white,
        )
      ),
      child: GestureDetector(
        child: Image.asset(
          path,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        onTap: () {
          if(_path != path){
            Future.delayed(const Duration(milliseconds: 250), () {
              _changestate(path);
            });
            controller.reverse();
          }
        }
      ),
    );
  }
}


