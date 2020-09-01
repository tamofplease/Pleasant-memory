import 'package:flutter/material.dart';
import 'package:meple/blocs/find/find_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:meple/models/choice.dart';
import 'package:meple/blocs/find/find.dart';

class FinderChoice extends StatefulWidget {
  FinderChoice({Key key}) : super(key: key);
  @override
  _FinderChoiceState createState() => _FinderChoiceState();
}

class _FinderChoiceState extends State<FinderChoice> {
  bool _selectedPlace = true;
  bool _selectedUser = true;

  void togglePlace() {
    setState(() => _selectedPlace = !_selectedPlace);
  }

  void toggleUser() {
    setState(() => _selectedUser = !_selectedUser);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            findChoices[0].title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Center(
              child: Container(
                  width: 300,
                  height: 220,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                          padding: _selectedPlace
                              ? EdgeInsets.only(top: 100)
                              : EdgeInsets.only(top: 160),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: GestureDetector(
                              onTap: () => BlocProvider.of<FindBloc>(context)
                                ..add(FindPlaceEvent()),
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text("ここでは他人がいきたいと思っている場所の検索ができます。"),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                  )),
                            ),
                          )),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: GestureDetector(
                              onLongPress: () =>
                                  BlocProvider.of<FindBloc>(context)
                                      .add(FindPlaceEvent()),
                              onTap: () => togglePlace(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  image: AssetImage(
                                    findChoices[0].image,
                                  ),
                                  fit: BoxFit.cover,
                                  // color: Colors.white30,
                                ),
                              ))),
                    ],
                  ))),

          Text(
            findChoices[1].title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Center(
              child: Container(
                  width: 300,
                  height: 220,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                          padding: _selectedUser
                              ? EdgeInsets.only(top: 100)
                              : EdgeInsets.only(top: 160),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: GestureDetector(
                              onTap: () => BlocProvider.of<FindBloc>(context)
                                  .add(FindUserEvent()),
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text("ここでは他人のuser_idを用いて友達の検索ができます。"),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                  )),
                            ),
                          )),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: GestureDetector(
                              onTap: () => toggleUser(),
                              onLongPress: () =>
                                  BlocProvider.of<FindBloc>(context)
                                      .add(FindUserEvent()),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  image: AssetImage(
                                    findChoices[1].image,
                                  ),
                                  fit: BoxFit.cover,
                                  // color: Colors.white30,
                                ),
                              ))),
                    ],
                  ))),

          // Center(
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       GestureDetector(
          //         onDoubleTap: () => toggleUser(),
          //         onTap: () => print("tap"),
          //         child: Container(
          //           width: 300.0,
          //           height: 200.0,
          //           child: Image(
          //             image: AssetImage(findChoices[1].image),
          //             // fit: BoxFit.cover,
          //           ),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10.0),
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () => toggleUser(),
          //         child: AnimatedContainer(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10.0),
          //             ),
          //             width: 300.0,
          //             height: 200.0,
          //             alignment: _selectedUser
          //                 ? Alignment.center
          //                 : AlignmentDirectional.topCenter,
          //             duration: Duration(seconds: 2),
          //             curve: Curves.fastOutSlowIn,
          //             transform: _selectedUser
          //                 ? Matrix4.rotationZ(0)
          //                 : Matrix4.rotationZ(-3.14 * 3 / 5),
          //             child: Container(
          //               width: 300.0,
          //               height: 200.0,
          //               child: Text("友達を探す"),
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   image: DecorationImage(
          //                     image: AssetImage(
          //                       findChoices[0].image,
          //                     ),
          //                   )),
          //             )),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
