import 'package:flutter/material.dart';

class MultiImageView extends StatefulWidget {
  final List<String> images;
  MultiImageView({Key key, this.images}) : super(key: key);

  @override
  _MultiImageViewState createState() => _MultiImageViewState();
}

class _MultiImageViewState extends State<MultiImageView> with SingleTickerProviderStateMixin{
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

  // List<String> images = ['images/image0.jpg', 'images/image1.jpg', 'images/image2.jpg'];
  String _path = 'images/image0.jpg';

  void _changestate(String path){
    setState(() {
      _path = path;
    });
  }
  List<Widget> list = new List<Widget>();
  
  @override
  Widget build(BuildContext context) {
    for(var i=0;i<widget.images.length;i++){
      if(widget.images[i]==null){
        list.add(smallImage('assets/images/noimage.png'));
      }else {
        list.add(smallImage(widget.images[i]));
      }
    }
    return  Center(
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
            children: list
          ),
        ],
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
        child: path == 'assets/images/noimage.png'
        ? Image.asset(
          path,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ) 
         : Image.network(
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


