import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MultiImageView extends StatefulWidget {
  final List<dynamic> images;
  MultiImageView({Key key, this.images}) : super(key: key);

  @override
  _MultiImageViewState createState() => _MultiImageViewState();
}

class _MultiImageViewState extends State<MultiImageView>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  List<Widget> list = new List<Widget>();
  @override
  void initState() {
    if (widget.images[0] == null) {
      _changeState(defaultImg);
      _changeIndex(0);
      list.add(smallImage(defaultImg, 0));
    } else {
      _changeState(widget.images[0]);
      _changeIndex(0);
      list.add(
        smallImage(widget.images[0].toString(), 0),
      );
      for (var i = 1; i < widget.images.length; i++) {
        list.add(smallImage(widget.images[i].toString(), i));
      }
    }
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final String defaultImg = 'assets/images/noimage.png';
  String _path;
  int _selectedIndex;

  void _changeState(String path) {
    setState(() {
      _path = path;
    });
  }

  void _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  child: (Image.network(
                    _path,
                    // fit: BoxFit.cover,
                  )),
                ),
              ),
              builder: (BuildContext context, Widget child) {
                return Opacity(
                  opacity: animation.value,
                  child: child,
                );
              }),
          SizedBox(
            height: 100,
            width: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: index == _selectedIndex
                        ? Colors.redAccent
                        : Colors.white,
                  )),
                  child: list[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget smallImage(String path, int index) {
    return GestureDetector(
        child: path == defaultImg
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
          _changeIndex(index);
          if (_path != path) {
            Future.delayed(const Duration(milliseconds: 250), () {
              _changeState(path);
            });
            controller.reverse();
          }
        });
  }
}
